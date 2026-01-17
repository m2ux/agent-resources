# Work Package Workflow

A structured workflow for planning and implementing features, enhancements, and technical changes.

## Overview

This workflow guides agents (and humans) through the complete lifecycle of a work package—from initial requirements gathering through implementation, testing, and delivery.

## Entry Point

Start with [`work-package.md`](work-package.md) for single work packages or [`work-packages.md`](work-packages.md) for multi-package initiatives.

## Phases

| Phase | Description | Key Artifacts |
|-------|-------------|---------------|
| **1. Setup** | Create folder structure, initialize documents | `START-HERE.md`, `README.md` |
| **2. Requirements** | Elicit and document requirements | `00-requirements-elicitation.md` |
| **3. Research** | Explore codebase, research solutions | Research notes |
| **4. Planning** | Create detailed work package plan | `03-work-package-plan.md` |
| **5. Implementation** | Execute the plan | Code changes |
| **6. Review** | Self-review before merge | PR description |
| **7. Completion** | Final checks, cleanup | Updated docs |

## Guides

| File | Purpose |
|------|---------|
| [`requirements-elicitation.guide.md`](requirements-elicitation.guide.md) | Structured approach to gathering requirements |
| [`knowledge-base-research.guide.md`](knowledge-base-research.guide.md) | Research using knowledge base tools |
| [`design-framework.guide.md`](design-framework.guide.md) | Design decision framework |
| [`architecture-review.guide.md`](architecture-review.guide.md) | Architecture review and ADR creation |
| [`test-plan.guide.md`](test-plan.guide.md) | Test planning and strategy |
| [`implementation-analysis.guide.md`](implementation-analysis.guide.md) | Analyzing implementation approach |
| [`github-issue-creation.guide.md`](github-issue-creation.guide.md) | Creating GitHub issues |
| [`pr-description.guide.md`](pr-description.guide.md) | Writing PR descriptions |
| [`task-completion-review.guide.md`](task-completion-review.guide.md) | Post-task verification checklist |
| [`assumptions-review.guide.md`](assumptions-review.guide.md) | Tracking assumptions during work |

## Templates

| File | Purpose |
|------|---------|
| [`start-here.guide.md`](start-here.guide.md) | Entry point for work package folder |
| [`readme.guide.md`](readme.guide.md) | Work package README |
| [`plan.guide.md`](plan.guide.md) | Work package plan structure |
| [`complete.guide.md`](complete.guide.md) | Completion checklist |

## Usage

1. Reference `work-package.md` or `work-packages.md` in your agent's context
2. Follow the phases sequentially
3. Use guides as needed for specific activities
4. Generate artifacts using templates

## Example

```
.engineering/artifacts/planning/2026-01-15-feature-name/
├── START-HERE.md                    # Entry point
├── README.md                        # Overview
├── 00-requirements-elicitation.md   # Requirements
├── 03-work-package-plan.md          # Detailed plan
├── 04-test-plan.md                  # Test strategy
└── 05-assumptions-log.md            # Tracked assumptions
```
