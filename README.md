# agentic-workflows

A version-controlled collection of prompts, guides, and documentation for agentic software engineering workflows, intended to be consumed by other repositories via submodules.

## What’s in this repo
Each workflow is a self-contained, revisioned artifact that an agent (or human) can follow consistently across projects.

- Prompt templates (system/developer/task)
- Step-by-step runbooks (planning, implementation, review, release)
- Checklists (quality gates, security, tests, docs)
- “Definition of done” and guardrails (what to do / what not to do)

## Layout
Keep each workflow isolated so it maps cleanly to a submodule mount point.

TBD

## Using as a submodule
Pin a specific workflow version in each target repo so agents behave deterministically over time.

```bash
git submodule add <REPO_URL> .agent/workflows
git submodule update --init --recursive
