# Chanakya: The AI Agent Control Plane

> *"The best strategist is the one who governs from behind the throne."*

Chanakya is a generic, versioned framework designed to keep AI coding agents (like Cursor, GitHub Copilot, or specialized agents) focused, accurate, and consistent. It solves the "context rot" problem—where agents lose performance as the chat history grows—by providing a structured, persistent knowledge hub and a sentinel health-check.

## 🧠 Why Chanakya?

In long development sessions, AI agents often:
1. **Forget project conventions**: They start suggesting patterns that conflict with your existing codebase.
2. **Lose track of architecture**: They make "local" fixes that break "global" patterns.
3. **Drown in noise**: They scan thousands of raw source files when they only need a high-signal distillation.
4. **Hallucinate**: They state facts about the project that are no longer true as the context window shifts.

**Chanakya** provides a "Control Plane" that stays always-on, regardless of chat length.

## 🏗️ Core Pillars

- **Distilled Knowledge**: Instead of raw docs, agents read high-signal "concept files" (OKF format) that explain *why* and *how*, not just *what*.
- **Canary (Sentinels)**: A set of verifiable "ground-truth" facts used to detect when an agent's context has degraded.
- **Branch Memory**: Persistent, per-branch working memory (`active-context.md`, `progress.md`) that carries context across chat sessions and model switches.
- **Always-on Rules**: Cursor `.mdc` rules that force agents to follow the strategist's loop on every single turn.

## 🚀 Quickstart

Chanakya is distributed as a standalone "engine" that you pull into your projects.

1.  **Clone the Shim**: Copy the `chanakya` bootstrap script to your project root.
2.  **Configure**: Create a `.chanakya.json` pointing to your engine repository.
3.  **Initialize**:
    ```bash
    ./chanakya init
    ```
4.  **Work**: Use the **Plan (Chanakya)** and **Implement (Chanakya)** modes to scope and execute changes.

## 🛠️ The CLI

The `chanakya` CLI is your single entry point for framework health:
- `status`: Check project health, branch memory, and source paths.
- `scan`: Reconcile framework artifacts (detect missing or stale files).
- `assess`: Quantify the token savings and context benefit.
- `produce`: Guide an agent through a knowledge distillation pass.
- `update`: Pull the latest strategist logic from your engine repo.

## 📜 Credits

Chanakya incorporates the following excellent community resources:

- **[Ponytail](https://github.com/DietrichGebert/ponytail)**: The "lazy senior dev mode" rule is created by **Dietrich Gebert**. Chanakya fetches the original rule directly from the source repository during initialization to ensure you have the latest version of this minimalist philosophy.

---
*Created by [Dinesh Bandaru](https://github.com/dineshwastaken). Distributed under the MIT License.*
