# My Marketing Pro on GitHub

My Marketing Pro builds an AI-assisted marketing operations platform for agencies and franchise networks. This organization hosts the code that powers the customer dashboard, the mobile companion apps, and the shared tooling we maintain for the wider community.

## Repositories
- [mmp-web-app](https://github.com/my-marketing-pro/mmp-web-app): PHP 8/MySQL web application that serves the customer-facing dashboard, admin console, scheduled jobs, and marketing automation workflows.
- [mmp-mobile](https://github.com/my-marketing-pro/mmp-mobile): Flutter application for iOS and Android that wraps the web experience, adds native sign-in, secure storage, push notification bootstrap, and offline awareness.
- [flutter_web_auth_2](https://github.com/my-marketing-pro/flutter_web_auth_2): Actively maintained Flutter plugin for cross-platform OAuth, deep-link, and custom scheme authentication flows used by My Marketing Pro and the open-source community.
- [.github](https://github.com/my-marketing-pro/.github): This `.github` repository with 
shared automation, documentation, and default settings applied across the organization.

Additional private repositories cover go-to-market collateral, product research, and exploratory prototypes. Ask the product or marketing leads if you need access to any of those supporting projects.

## Org-wide configuration (this repo)
- `settings.yml` defines our default repository settings and org-wide labels. The file is consumed by [Probot Settings](https://github.com/probot/settings) so every repo inherits the same issue labels and branch protections.
- `README.md` (this file) documents the purpose of the GitHub organization and the key codebases under active development.

To sync labels outside of the scheduled automation, install the Settings app on the target repository or trigger a manual sync from the GitHub UI after updating `settings.yml`.

## Working with the org
- Cut issues in the repository that best matches the area of work (`mmp-web-app` for web, `mmp-mobile` for native, etc.).
- Follow the contribution guides in each repository before opening pull requests.
- Ping `@my-marketing-pro/engineering` in GitHub Discussions or Slack for questions about repository ownership or tooling.
