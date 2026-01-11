# Work Package Workflow

A structured workflow for planning and implementing features, enhancements, and technical changes.

## Overview

This workflow guides agents (and humans) through the complete lifecycle of a work package—from initial requirements gathering through implementation, testing, and delivery.

## Entry Point

Start with [`_workflow.md`](_workflow.md) — the master document that defines all phases and orchestrates the guides below.

## Phases

| Phase | Description | Key Artifacts |
|-------|-------------|---------------|
| **1. Setup** | Create folder structure, initialize documents | `START-HERE.md`, `README.md` |
| **2. Requirements** | Elicit and document requirements | `00-requirements-elicitation.md` |
| **3. Research** | Explore codebase, research solutions | Research notes |
| **4. Planning** | Create detailed work package plan | `01-work-package-plan.md` |
| **5. Implementation** | Execute the plan | Code changes |
| **6. Review** | Self-review before merge | PR description |
| **7. Completion** | Final checks, cleanup | Updated docs |

## Guides

| File | Purpose |
|------|---------|
| [`requirements-elicitation-guide.md`](requirements-elicitation-guide.md) | Structured approach to gathering requirements |
| [`knowledge-base-research-guide.md`](knowledge-base-research-guide.md) | Research using knowledge base tools |
| [`design-framework-guide.md`](design-framework-guide.md) | Design decision framework |
| [`adr-creation-guide.md`](adr-creation-guide.md) | Creating Architecture Decision Records |
| [`test-plan-creation-guide.md`](test-plan-creation-guide.md) | Test planning and strategy |
| [`implementation-analysis-guide.md`](implementation-analysis-guide.md) | Analyzing implementation approach |
| [`issue-creation-guide.md`](issue-creation-guide.md) | Creating GitHub issues |
| [`pr-description-guide.md`](pr-description-guide.md) | Writing PR descriptions |
| [`self-review-guide.md`](self-review-guide.md) | Pre-merge self-review checklist |
| [`assumptions-guide.md`](assumptions-guide.md) | Tracking assumptions during work |

## Templates

| File | Purpose |
|------|---------|
| [`start-here-template.md`](start-here-template.md) | Entry point for work package folder |
| [`readme-template.md`](readme-template.md) | Work package README |
| [`plan-template.md`](plan-template.md) | Work package plan structure |
| [`complete-template.md`](complete-template.md) | Completion checklist |

## Usage

1. Reference `_workflow.md` in your agent's context
2. Follow the phases sequentially
3. Use guides as needed for specific activities
4. Generate artifacts using templates

## Example

```
.ai/planning/2026-01-15-feature-name/
├── START-HERE.md                    # Entry point
├── README.md                        # Overview
├── 00-requirements-elicitation.md   # Requirements
├── 01-work-package-plan.md          # Detailed plan
├── 02-test-plan.md                  # Test strategy
└── 04-assumptions-log.md            # Tracked assumptions
```
