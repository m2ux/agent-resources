# Agent Workflows

A version-controlled collection of packaged workflows for agentic software engineering, intended to be consumed by other repositories via submodules.

## Overview

Each workflow is a self-contained, revisioned package that an agent (or human) can follow consistently across projects. Workflows include:

- Step-by-step runbooks
- Checklists and quality gates
- Templates and scaffolding
- Guardrails and constraints

## Available Workflows

| Workflow | Description |
|----------|-------------|
| [`work-package/`](work-package/) | Planning and implementation workflow for features and enhancements |

*More workflows coming soon.*

## Layout

```
agent-workflows/
├── AGENTS.md              # AI agent behavior guidelines (shared)
├── work-package/          # Work package workflow
│   ├── _workflow.md       # Main workflow document
│   ├── *-guide.md         # Step-by-step guides
│   └── *-template.md      # Templates
└── <future-workflow>/     # Additional workflows follow same pattern
```

Each workflow folder contains:
- `_workflow.md` — Master document defining phases and steps
- `*-guide.md` — Detailed guidance for specific activities
- `*-template.md` — Reusable templates

## Using as a Submodule

Pin a specific version in each target repo so agents behave deterministically.

```bash
# Add to your project's engineering branch
git submodule add https://github.com/m2ux/agent-workflows.git workflows
git commit -m "chore: add agent-workflows submodule"

# Clone a repo with submodules
git clone --recurse-submodules <repo-url>

# Update submodule to latest
git submodule update --remote workflows
git commit -m "chore: update agent-workflows"
```

## Contributing

To add a new workflow:

1. Create a new top-level folder (e.g., `code-review/`)
2. Add `_workflow.md` as the entry point
3. Add supporting guides and templates
4. Update this README's workflow table

## License

Apache-2.0
