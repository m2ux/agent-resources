# Agent Workflows

Packaged workflows for agentic software engineering. Designed to be included as a version-pinned submodule within an orphan `engineering` branch in your project repository, keeping workflow definitions separate from code history while remaining co-located with the project.

The **engineering branch pattern** uses a Git orphan branch to store planning artifacts, ADRs, and agent configuration alongside your code without polluting its commit history. When cloned locally, it appears as a `.engineering/` folder:

```
my-project/
├── src/                       # Your code (main branch)
├── ...
└── .engineering/              # Engineering branch (locally ignored)
    ├── artifacts/
    │   ├── adr/               # Architecture Decision Records
    │   ├── planning/          # Work package plans
    │   ├── reviews/           # Code reviews
    │   └── templates/         # Reusable templates
    ├── agent/
    │   ├── workflows/         # ← This repo (submodule)
    │   └── metadata/          # Private metadata (optional)
    └── scripts/               # Update scripts
```

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
├── deploy.sh              # Engineering branch deployment script
├── work-package/          # Work package workflow
│   ├── _START_HERE.md     # Entry point for workflow inclusion
│   ├── workflow.md        # Main workflow document
│   ├── *-guide.md         # Step-by-step guides
│   └── *-template.md      # Templates
└── <future-workflow>/     # Additional workflows follow same pattern
```

Each workflow folder contains:
- `_START_HERE.md` — Entry point with mandatory rules and getting started instructions
- `workflow.md` — Master document defining phases and steps
- `*-guide.md` — Detailed guidance for specific activities
- `*-template.md` — Reusable templates

## Deployment

Deploy an engineering branch to any project:

```bash
# Copy deploy script to your project root
cp /path/to/agent-workflows/deploy.sh ./
# Or download directly:
curl -O https://raw.githubusercontent.com/m2ux/agent-workflows/main/deploy.sh

# Run it
./deploy.sh
```

The script:
1. Creates an `engineering` branch if it doesn't exist
2. Adds `.engineering/` to local git exclude
3. Clones to `.engineering/`
4. Initializes submodules (workflows + optional private metadata)
5. Self-destructs

### Options

| Option | Description |
|--------|-------------|
| `--external-repo <url>` | Use external repo for engineering branch |
| `--workflows-repo <url>` | Custom workflows repo |
| `--metadata-repo <url>` | Custom metadata repo |
| `--skip-metadata` | Skip private metadata submodule |
| `--keep` | Don't self-destruct after deployment |

### Submodule Management

```bash
cd .engineering

# Update workflows to specific version
./scripts/update-workflows.sh v0.3.0

# Update metadata to latest
./scripts/update-metadata.sh
```

## Contributing

To add a new workflow:

1. Create a new top-level folder (e.g., `code-review/`)
2. Add `_START_HERE.md` as the entry point with mandatory rules
3. Add `workflow.md` as the main workflow document
4. Add supporting guides and templates
5. Update this README's workflow table

## License

Apache-2.0
