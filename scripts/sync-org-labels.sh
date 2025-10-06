#!/usr/bin/env bash
# sync-org-labels.sh
# Apply labels defined in a JSON file to every repo in a GitHub organization.

set -euo pipefail

usage() {
  printf 'Usage: %s <org-slug> [labels.json]\n\n' "$0"
  printf 'Arguments:\n'
  printf '  <org-slug>    GitHub organization to update (required)\n'
  printf '  [labels.json] Path to the labels definition file (default: labels.json in cwd)\n\n'
  printf 'Requirements:\n'
  printf '  - GitHub CLI (gh) authenticated with write access to the organization\n'
  printf '  - jq installed locally\n'
}

if [[ $# -lt 1 ]]; then
  usage
  exit 1
fi

ORG="$1"
LABEL_FILE="${2:-labels.json}"

if [[ ! -f "$LABEL_FILE" ]]; then
  echo "[x] Label file not found: $LABEL_FILE" >&2
  exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "[x] jq is required but not found in PATH." >&2
  exit 1
fi

if ! command -v gh >/dev/null 2>&1; then
  echo "[x] GitHub CLI (gh) is required but not found in PATH." >&2
  exit 1
fi

printf "Checking GitHub CLI auth... "
if gh auth status -h github.com >/dev/null 2>&1; then
  echo "ok"
else
  echo "failed"
  exit 1
fi

REPOS=$(gh repo list "$ORG" --limit 1000 --json name,isArchived,viewerPermission --jq '.[] | select((.isArchived|not) and (.viewerPermission|IN("ADMIN","MAINTAIN","WRITE"))) | .name')

if [[ -z "$REPOS" ]]; then
  echo "Warning:  No writable, non-archived repositories found in $ORG."
  exit 0
fi

apply_label() {
  local repo="$1"
  local label_json="$2"
  local name color description encoded

  name=$(jq -r '.name' <<<"$label_json")
  color=$(jq -r '.color' <<<"$label_json" | tr '[:lower:]' '[:upper:]')
  description=$(jq -r '.description // ""' <<<"$label_json")
  encoded=$(jq -rn --arg v "$name" '$v|@uri')

  echo "    - $name"

  if ! gh api --silent --method PATCH \
    -H "Accept: application/vnd.github+json" \
    "/repos/$ORG/$repo/labels/$encoded" \
    -f new_name="$name" \
    -f color="$color" \
    ${description:+-f description="$description"} >/dev/null 2>&1; then
    gh api --silent --method POST \
      -H "Accept: application/vnd.github+json" \
      "/repos/$ORG/$repo/labels" \
      -f name="$name" \
      -f color="$color" \
      ${description:+-f description="$description"} >/dev/null
  fi
}

echo "$REPOS" | while read -r repo; do
  [[ -z "$repo" ]] && continue
  echo "-> Syncing labels to $ORG/$repo"
  while IFS= read -r label; do
    apply_label "$repo" "$label"
  done < <(jq -c '.[]' "$LABEL_FILE")
done

echo "[done] Label sync complete."
