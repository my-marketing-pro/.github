# My Marketing Pro

We build an AI-assisted marketing operations platform that helps agencies and franchise networks plan, launch, and measure campaigns across every channel. Our GitHub organization houses the code that delivers the customer-facing experience, the mobile companion apps, and the tooling that keeps our teams shipping quickly.

## Product Repositories
- [mmp-web-app](https://github.com/my-marketing-pro/mmp-web-app): PHP/MySQL monolith that powers the customer dashboard, admin tools, scheduled jobs, and automation workflows.
- [mmp-mobile](https://github.com/my-marketing-pro/mmp-mobile): Flutter application for iOS and Android that wraps the web experience, adds native authentication, secure storage, and push bootstrap.
- [flutter_web_auth_2](https://github.com/my-marketing-pro/flutter_web_auth_2): Maintained Flutter plugin providing secure OAuth and deep-link flows used by our apps and the community.

## Shared Tooling
- [github-configs](https://github.com/my-marketing-pro/.github): Org-level automation, profile content, and community health files.
- [`labels/labels.json`](../labels/labels.json): Source of truth for the shared issue label taxonomy.
- [`scripts/sync-org-labels.sh`](../scripts/sync-org-labels.sh): GitHub CLI helper that syncs the shared labels across every writable repository (defaults to `labels/labels.json`).

Additional private repositories cover go-to-market collateral, product discovery, and prototype experiments. Reach out in Slack or the #engineering channel if you need access.

## Working Together
- File issues in the repository that owns the surface area (`mmp-web-app` for web, `mmp-mobile` for native, etc.).
- Use the shared labels defined in `labels/labels.json` (applied via `scripts/sync-org-labels.sh`) to tag work by type, priority, platform, and status.
- Follow the contribution guides in each repository and request reviews from `@my-marketing-pro/engineering` for cross-team changes.
- For questions about ownership or process, start a GitHub Discussion or message the engineering leads in Slack.
