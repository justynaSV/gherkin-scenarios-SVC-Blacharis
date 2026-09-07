# Getting Started

This guide explains how to write scenarios from user stories with Copilot or Claude Code in this repository, keep traceability up to date, and add step definitions when scenarios should become executable.

## 1. Open the repository in VS Code

1. Open VS Code.
2. Choose **File > Open Folder**.
3. Select this repository's folder.
4. When VS Code shows a prompt to install the recommended extensions, click **Install All**. Otherwise, install them manually (see below).
5. Open Copilot Chat.

### Required and recommended extensions

- **GitHub Copilot Chat** (`GitHub.copilot-chat`) — required to run the `/gherkin-scenarios` prompt with Copilot.
- **Cucumber** (`CucumberOpen.cucumber-official`) — required for `.feature` file syntax highlighting, step autocompletion, and jumping from a Gherkin step to its step definition. The repository's `.vscode/settings.json` already configures `cucumber.glue` and `cucumber.features` for this extension.

If you want to use Claude instead of Copilot, also install:

- **Claude Code for VS Code** (`anthropic.claude-code`) — runs the `/gherkin-scenarios` command through Claude Code inside VS Code. It still needs the Claude Code CLI installed (see [Using Claude Code instead](#using-claude-code-instead) below); the extension launches and embeds it.

These extensions are listed in `.vscode/extensions.json`, so VS Code recommends them automatically when the folder is opened.

The prompt file lives at `.github/prompts/gherkin-scenarios.prompt.md`. In Copilot Chat, it is available as:

```text
/gherkin-scenarios
```

### Using Claude Code instead

The same workflow is available in Claude Code via the matching command at `.claude/commands/gherkin-scenarios.md`,
usable as `/gherkin-scenarios` in a Claude Code session opened in this repository. `CLAUDE.md` at the repository
root carries the same repository conventions as `.github/copilot-instructions.md`.

Claude Code is a command-line tool, installed separately from VS Code. You need Node.js 18 or newer (this
repository already requires 22.12.0+), then install it globally:

```sh
npm install -g @anthropic-ai/claude-code
```

Alternative native installers, if you prefer not to use npm:

```sh
# macOS / Linux
curl -fsSL https://claude.ai/install.sh | bash

# Windows PowerShell
irm https://claude.ai/install.ps1 | iex
```

Start it from the repository folder and follow the browser prompt to sign in with your Claude account the first
time:

```sh
cd <this-repo>
claude
```

Inside the session, `/gherkin-scenarios` runs the generation command and `/mcp` manages MCP servers (see the
Jira/MCP setup below).

## 2. Run validation

Use Node.js 22.12.0 or newer.

```sh
npm run validate
```

Validation is self-contained and does not require `npm install`. It checks the real feature files already in `features/`.

Install dependencies only when you want to run Cucumber commands such as `npm run bdd:dry-run`, `npm run bdd:smoke`, or `npm run bdd`:

```sh
npm install
```

## 3. Prepare the user story

You can paste a full story directly into Copilot Chat. When possible, use this structure:

```text
Story

AS A <role or user type>
I WANT <capability or action>
TO <business outcome or user value>

Business context & logic
- <why this story matters>
- <business rule, policy, calculation, validation, or constraint>

Business process flow
1. <starting context or trigger>
2. <main user or system action>
3. <decision point, validation, or alternate path>
4. <expected process outcome>

Acceptance criteria
- Given <context>, when <action>, then <expected result>
- Given <error or edge case>, when <action>, then <expected result>
```

If some information is missing, the prompt should ask follow-up questions before generating scenarios.

### Optional: use a Jira link instead of pasting the story

Instead of pasting the story text, you can give the assistant a Jira issue link (e.g. `https://<site>.atlassian.net/browse/PROJ-123`) or bare key (`PROJ-123`) in step 4. It fetches the issue through the Atlassian MCP server (`https://mcp.atlassian.com/v1/mcp`). This is a one-time setup per machine.

#### VS Code (Copilot)

1. Open the Command Palette (`Ctrl+Shift+P`) and run **MCP: Add Server**.
2. Choose **HTTP**, enter name `atlassian` and URL `https://mcp.atlassian.com/v1/mcp`, then pick the **Global** scope so it's available in every repo, not just this one.
3. Run **MCP: List Servers**, select `atlassian`, and choose **Start Server** — this opens a browser window to log in with your Atlassian/Jira Cloud account. Complete the login once.
4. From then on, pasting a Jira link or key into `/gherkin-scenarios` fetches the summary, description, acceptance criteria, and sub-tasks automatically.

#### Claude Code

This repository ships a `.mcp.json` at its root that already defines the `atlassian` HTTP server, so Claude Code
picks it up automatically — you only need to approve it and log in:

1. Start Claude Code in the repository folder (`claude`). The first time it sees `.mcp.json` it asks whether to
   use the project's MCP servers — approve it.
2. Run `/mcp`, select `atlassian`, and choose **Authenticate** (or **Reconnect**). A browser window opens to log
   in with your Atlassian/Jira Cloud account. Complete the login once; the token is cached for future sessions.
3. `/mcp` should now show `atlassian` as **connected**.
4. From then on, pasting a Jira link or key into `/gherkin-scenarios` fetches the summary, description, acceptance
   criteria, and sub-tasks automatically.

If `.mcp.json` is missing or you want the server available in every repository, add it from the command line
instead:

```sh
# project scope: writes/updates .mcp.json in this repo (shared with the team)
claude mcp add --transport http --scope project atlassian https://mcp.atlassian.com/v1/mcp

# user scope: available in all your local repositories, not committed
claude mcp add --transport http --scope user atlassian https://mcp.atlassian.com/v1/mcp
```

Then run `/mcp` and authenticate as in step 2 above. `claude mcp list` shows the configured servers and their
connection status.

If you skip this setup entirely, just paste the story text as shown above.

## 4. Generate a feature file with Copilot

1. Open Copilot Chat.
2. Type the prompt command:

```text
/gherkin-scenarios
```

3. Paste the user story below the command.
4. Answer any follow-up questions.
5. Review the assumptions, tags, scenarios, and suggested file path.
6. Confirm the save path only after the generated feature looks correct.

Feature files live under `features/`, grouped into module folders, for example:

```text
features/calendar icons/wizyta-niepotwierdzona.feature
features/potwierdzenie-wizyty/nowa-naprawa-oferta-do-sms.feature
features/reakcja-na-odpowiedz-na-pytania/historia-zmian-dosprzedaz.feature
```

Each first-level folder under `features/` is treated as a separate module. After adding or updating `.feature` files in a module folder, generate the matching step-definition file with:

```sh
npm run create:module -- <module-folder>
```

This creates the module folder under `features/` (if it does not exist yet) and generates a matching `features/~step_definitions/<module-folder>.steps.js` with one stub per **unique step actually used in that module's feature files** (converted to a Cucumber Expression, e.g. `{string}`/`{int}` placeholders) — not generic placeholder text. Re-run the same command after editing a feature file; it only appends the steps that are still missing, so it never overwrites work you've already implemented.

The Copilot prompt (and the equivalent Claude Code command) is configured to run `npm run create:module -- <module-folder>` automatically after saving a feature file in a new module folder.

## 5. Update traceability

Every scenario should be mapped in `docs/traceability.md`.

Use one row per scenario:

```md
| Story ID | Acceptance criterion | Feature file | Scenario name | Tags |
| --- | --- | --- | --- | --- |
| S1 | AC1 | `features/konfiguracja-planer/szablony-wiadomosci.feature` | `Wyświetlenie podsekcji Szablony Planera w konfiguracji VS` | `@smoke @regression @ui` |
```

Run validation after updating the table:

```sh
npm run validate
```

## 6. Create step definitions

Step definitions connect Gherkin text to executable JavaScript or TypeScript code.

Create step definition files under:

```text
features/~step_definitions/
```

Use the module name in the file name:

```text
features/~step_definitions/calendar-icons.steps.js
features/~step_definitions/potwierdzenie-wizyty.steps.js
features/~step_definitions/widok-wiadomosci-sms.steps.js
```

Start from the templates in `templates/step-definitions/` when useful.

### JavaScript example

For this Gherkin scenario (from `features/widok-wiadomosci-sms/wyglad-wiadomosci-sms.feature`):

```gherkin
Background:
  Given klient otrzymał wiadomość SMS z unikalnym linkiem do widoku wiadomości

Scenario: Wyświetlenie sekcji danych Klienta i Pojazdu, logotypu oraz stopki
  When klient otwiera unikalny link z wiadomości SMS
  Then użytkownik widzi sekcję z danymi Klienta i Pojazdu na górze widoku
```

`npm run create:module` already scaffolds `features/~step_definitions/widok-wiadomosci-sms.steps.js` with a pending stub per step. Implement the body, for example:

```js
const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('klient otrzymał wiadomość SMS z unikalnym linkiem do widoku wiadomości', async () => {
  world.smsLink = await world.app.sendConfirmationSms();
});

When('klient otwiera unikalny link z wiadomości SMS', async () => {
  await world.app.openLink(world.smsLink);
});

Then('użytkownik widzi sekcję z danymi Klienta i Pojazdu na górze widoku', async () => {
  assert.equal(await world.app.hasClientAndVehicleSection(), true);
});
```

The `world` object is shared state for the scenario. Add project-specific drivers, test users, API clients, or page objects to `features/~support/world.js`.

## 7. Add project support code

`features/~support/world.js` includes a minimal Cucumber World. For executable tests, extend it with project-specific helpers.

Common additions include:

- an app or page driver,
- API client setup,
- safe test users,
- reusable test data,
- cleanup logic after each scenario.

Keep secrets out of Git. Put real URLs, users, and passwords in local environment variables or CI secrets. Keep only safe placeholders in `.env.example`.

## 8. Check undefined steps

After adding feature files, run a dry run:

```sh
npm run bdd:dry-run
```

If Cucumber reports undefined steps, run `npm run create:module -- <module-folder>` to generate stubs for them, then implement the `TODO` bodies (they return `'pending'` until you do) in `features/~step_definitions/`.

## 9. Run scenarios

Use tags to run smaller groups:

```sh
npm run bdd:smoke
npm run bdd:regression
npm run bdd
```

Full executable runs require project-specific step definitions and support code. Reports are written to `reports/`.

## 10. Commit and open a pull request

Before committing, run:

```sh
npm run validate
npm install
npm run bdd:dry-run
```

Then commit the scenario changes:

```sh
git add .
git commit -m "Add scenarios for <story-id>"
git push
```

Open a pull request for review. The CI workflow validates feature files and traceability before merge.

## Recommended workflow

1. Create or update the user story.
2. Generate the feature file with Copilot.
3. Review scenarios with QA, product, and developers.
4. Update traceability.
5. Run `npm run validate`.
6. Add step definitions when automation is needed.
7. Run `npm install` and `npm run bdd:dry-run`.
8. Run tagged executable scenarios when project support code is ready.
9. Commit and open a pull request.