# Work Package Workflow - Start Here

## ⚠️ MANDATORY: Read AGENTS.md First

**Before starting any work package, agents MUST read and follow AGENTS.md.**

This file contains critical guidelines for:
- Code modification boundaries (when to ask permission)
- Communication standards (tone, language, no process attribution)
- Implementation workflow boundaries (one task at a time)
- File and directory restrictions
- Version control practices

**Key rules from AGENTS.md that apply to this workflow:**
1. **Do not modify code unless explicitly directed by the user**
2. **Complete only ONE numbered task at a time** - stop and ask permission before proceeding
3. **Never add process attribution comments** to code
4. **Never commit changes unless user explicitly asks**

📄 **Reference:** [AGENTS.md](../../AGENTS.md)

---

## New Work or Resuming?

| Situation | Document | When to Use |
|-----------|----------|-------------|
| **Starting fresh** | See [Choose Your Workflow](#choose-your-workflow) below | No existing branch or starting a new work package |
| **Resuming work** | [resume-work.md](resume-work.md) | Continuing work on an existing branch (new chat session, work started elsewhere, etc.) |

**If resuming:** The resume workflow will assess the current state of your branch/PR and determine where to continue in the standard workflow. Minimum requirement is an existing branch name.

---

## Choose Your Workflow

Select the appropriate workflow based on the scope of work:

| Scope | Workflow | When to Use |
|-------|----------|-------------|
| **Single Work Package** | [work-package.md](work-package.md) | A focused task that can be completed in one work package |
| **Multiple Work Packages** | [work-packages.md](work-packages.md) | Complex initiatives requiring multiple coordinated work packages |

**How to decide:**
- If the request involves a single feature, fix, or enhancement → use **work-package.md**
- If the request involves multiple phases, features, or requires high-level planning → use **work-packages.md**

---

## Workflow Rules Are Mandatory

Both workflows define how to plan and implement work packages from inception to merged PR. **All rules and checkpoints in the workflows are mandatory and must be followed.**

### Core Workflow Rules

- **Agents must NOT proceed past checkpoints without user confirmation**
- **Ask, don't assume** - Clarify requirements before acting
- **Summarize, then proceed** - Provide brief status before asking to continue
- **One task at a time** - Complete current work before starting new work
- **Explicit approval** - Get clear "yes" or "proceed" before major actions

---

## Getting Started

1. **Read [AGENTS.md](../../AGENTS.md)** (`.engineering/agent/resources/AGENTS.md`)
2. **Determine if starting fresh or resuming:**
   - **Resuming?** → Use [resume-work.md](resume-work.md) to assess state and find entry point
   - **Starting fresh?** → Select workflow based on scope (single or multiple work packages)
3. **Follow each phase in sequence**, respecting all checkpoints
4. **Use the reference guides** linked from each workflow phase for detailed instructions

📄 **Resume Work:** [resume-work.md](resume-work.md)
📄 **Single Work Package:** [work-package.md](work-package.md)
📄 **Multiple Work Packages:** [work-packages.md](work-packages.md)
