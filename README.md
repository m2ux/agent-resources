# Agent Resources

Packaged workflows and resources for agentic software engineering. Designed to be included as a version-pinned submodule within an orphan `engineering` branch in your project repository, keeping workflow definitions separate from code history while remaining co-located with the project.

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
    └── agent/
        ├── resources/         # ← This repo (submodule)
        │   └── scripts/       # Update scripts (included)
        └── metadata/          # Private metadata (optional)
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
| [`work-package/`](workflows/work-package/) | Planning and implementation workflow for features and enhancements |
| [`general/`](workflows/general/) | General purpose prompts and guides |
| [`developer/`](workflows/developer/) | Developer focused prompts and guides |

## Getting Started

### 1. Deploy to Your Project

From the root of your target project:

```bash
# Download and run the deployment script
curl -O https://raw.githubusercontent.com/m2ux/agent-resources/main/deploy.sh
./deploy.sh
```

This creates a `.engineering/` folder in your project containing the workflows. See [Deployment](#deployment) for options.

### 2. Start a Work Package

In your AI assistant chat, add the workflow entry point and describe your task:

```
@.engineering/agent/resources/workflows/work-package/_START_HERE.md

I want to implement [describe your feature, bug fix, or enhancement here]
```

The agent will read the mandatory rules and guide you through the workflow phases: issue creation, requirements, research, planning, implementation, and validation.

## Layout

```
agent-resources/
├── AGENTS.md              # AI agent behavior guidelines (shared)
├── deploy.sh              # Engineering branch deployment script
├── scripts/               # Submodule update scripts
│   ├── update-resources.sh  # Update this submodule to a version tag
│   └── update-metadata.sh   # Update metadata submodule to latest
└── workflows/             # Workflow definitions
    ├── work-package/      # Work package(s) workflow
    ├── general/           # General purpose prompts and guides
    └── developer/         # Developer focused prompts and guides
```

**Workflows** (`workflows/`) — Self-contained workflow definitions with all guides included

## Deployment

Deploy an engineering branch to any project:

```bash
# Copy deploy script to your project root
cp /path/to/agent-resources/deploy.sh ./
# Or download directly:
curl -O https://raw.githubusercontent.com/m2ux/agent-resources/main/deploy.sh

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

# Update resources to specific version
./agent/resources/scripts/update-resources.sh v0.3.0

# Update metadata to latest
./agent/resources/scripts/update-metadata.sh
```

## Contributing

To add a new workflow:

1. Create a new top-level folder (e.g., `code-review/`)
2. Add `_START_HERE.md` as the entry point with mandatory rules
3. Add `_work-package.md` (single) or `_work-packages.md` (multi) as main workflow documents
4. Add supporting guides and templates
5. Update this README's workflow table

## License

Apache-2.0
