# gherkin-scenarios-SVC-Blacharis

Gherkin scenario repository for the SVC Blacharis project, created from the `gherkin-scenarios` template.

This repository holds the `.feature` files and Cucumber.js step definitions used to document and validate SVC Blacharis behavior from user stories, plus the tooling to keep scenarios consistent and traceable.

## Start Here

New to this repository? Start with `docs/getting-started.md` — it covers writing scenarios from a user story with the `/gherkin-scenarios` Copilot prompt, saving `.feature` files, updating traceability, adding step definitions, and running validation/Cucumber checks.

For day-to-day work, the short version is:

1. Paste a user story (or a Jira issue key/URL) into Copilot Chat with `/gherkin-scenarios`.
2. Answer follow-up questions and review the generated scenarios.
3. Save the `.feature` file under the right module folder in `features/`.
4. Run `npm run create:module -- <module-folder>` if it's a new module, to scaffold/update step definitions.
5. Run `npm run trace:generate` to regenerate `docs/traceability.md` (the `/gherkin-scenarios` prompt does this for you).
6. Add or update step definitions in `features/~step_definitions/`.
7. Run `npm run validate` (and Cucumber checks, once step definitions exist).
8. Commit and open a pull request.

## What This Repository Contains

- The `/gherkin-scenarios` Copilot prompt for generating Gherkin `.feature` files from pasted user stories, at `.github/prompts/gherkin-scenarios.prompt.md`.
- A guided workflow document in `docs/getting-started.md`.
- User story and feature templates in `templates/`, used when generating new scenarios.
- Feature files grouped into module folders under `features/` (for example `features/calendar icons/`, `features/potwierdzenie-wizyty/`).
- Step definitions and Cucumber.js support files under `features/~step_definitions/` and `features/~support/`.
- Built-in Gherkin style validation, language validation, duplicate-step detection, and traceability checks.
- A traceability matrix in `docs/traceability.md`.
- A tag glossary in `docs/tags.md`.
- GitHub Actions validation for pull requests and pushes to `main`.

## Repository Layout

```text
.github/
  prompts/
    gherkin-scenarios.prompt.md
  workflows/
    validate-features.yml

docs/
  getting-started.md
  running-bdd.md
  tags.md
  traceability.md

features/
  ~step_definitions/
  ~support/

templates/
  feature.template
  user-story-paste.template.txt
  user-story.template.txt
  step-definitions/

scripts/
  check-duplicate-steps.js
  check-feature-language.js
  check-gherkin-style.js
  check-traceability.js
  create-module.js
```

## Use The Copilot Prompt

1. Open Copilot Chat in VS Code.
2. Type:

```text
/gherkin-scenarios
```

3. Paste a user story below the command.
4. Answer follow-up questions about business context, process flow, business rules, or acceptance criteria.
5. Review the generated assumptions, tags, scenarios, and suggested save path.
6. Confirm the exact path before Copilot creates folders or saves the `.feature` file.

The prompt asks where to save a feature when no target folder is clear. Feature files live under `features/`, grouped by module, for example:

```text
features/calendar icons/wizyta-niepotwierdzona.feature
features/potwierdzenie-wizyty/nowa-naprawa-oferta-do-sms.feature
features/reakcja-na-odpowiedz-na-oferte/historia-zmian-dosprzedaz.feature
```

Each first-level folder under `features/` is treated as a separate module. When the prompt creates a new module folder, it also runs `npm run create:module -- <module-folder>` to generate a matching `features/~step_definitions/<module-folder>.steps.js` file.

You can create the module folder and matching step-definition scaffold manually with:

```sh
npm run create:module -- <module-folder>
```

This parses every `.feature` file already in that module folder and generates stub functions in the matching `.steps.js` file using the real Gherkin step text as the Cucumber Expression (not generic placeholders). Steps that already exist in the file are left untouched; only missing ones are appended, so re-running it after editing a feature is safe.

## Recommended User Story Format

You can start from `templates/user-story.template.txt`, or use `templates/user-story-paste.template.txt` when pasting a fuller story into the `/gherkin-scenarios` prompt.

```text
As a <role>
I want <capability>
So that <business value>

Acceptance criteria:
- Given <context>, when <action>, then <outcome>
- ...

Business rules:
- ...

Out of scope:
- ...
```

## Scenario Writing Checklist

- Start with the main happy path.
- Add negative paths, validation errors, permissions, boundary values, and empty states.
- Prefer `Scenario Outline` when only input data changes.
- Use `Background` only for setup shared by most scenarios.
- Keep each step focused on one action or one assertion.
- Describe behavior visible to the user or API consumer.
- Avoid implementation details such as CSS selectors, database tables, or framework methods.
- Use safe example data and never include real credentials, tokens, or personal data.

## Default Tags

- `@<feature-name>` on each feature, using kebab-case.
- `@smoke` on the core happy-path scenario.
- `@regression` on all scenarios that belong in the regression suite.
- `@translations` on scenarios that validate localized labels, names, tooltips, or messages.
- Domain tags when relevant, such as `@ui`, `@api`, `@security`, `@accessibility`, `@permissions`, or `@performance`.

## Validation

Use Node.js 22.12.0 or newer. The GitHub Actions workflow runs on Node 22.

Run validation before committing feature changes:

```sh
npm run validate
```

Validation is self-contained and does not require `npm install`. This keeps the first run simple for QA users and avoids missing local command shims from external packages.

Validation includes:

- Built-in Gherkin style and naming rules.
- Feature-language checks for Polish and English scenario text.
- Duplicate-step detection inside individual scenarios.
- Traceability coverage checks from `docs/traceability.md`.

## Step Definitions

Step definitions live under `features/~step_definitions/`, one file per module. `npm run create:module -- <module-folder>` keeps these files in sync with the `.feature` files (it only appends missing steps, so it's safe to re-run after editing a feature). Use the templates in `templates/step-definitions/` as a starting point for new step implementations.

Module convention:

- `features/calendar icons/` -> `features/~step_definitions/calendar-icons.steps.js`
- `features/potwierdzenie-wizyty/` -> `features/~step_definitions/potwierdzenie-wizyty.steps.js`

## Running BDD Scenarios

Use `docs/running-bdd.md` for the execution guide. The main commands are:

Install dependencies before running Cucumber commands:

```sh
npm install
```

```sh
npm run bdd:dry-run
npm run bdd:smoke
npm run bdd:regression
npm run bdd
```

Executable runs require project-specific step definitions and application adapters.

## Traceability

`docs/traceability.md` links story IDs, acceptance criteria, feature files, scenario names, and tags. It is **generated** by `npm run trace:generate` from the `# Zadanie`/`# AC` comments and tags in the `.feature` files — do not edit the table by hand. `npm run validate` fails if the matrix is stale, so regenerate it after any feature change (the `/gherkin-scenarios` prompt does this automatically).
