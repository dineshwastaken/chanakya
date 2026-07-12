# Chanakya

Chanakya is a generic, versioned control framework for AI coding agents. It ensures that agents deliver consistent, high-quality output even as the context window fills, by using distilled knowledge, per-branch memory, and a canary health-check.

Named after Chanakya, the ancient Indian strategist who governed from behind the throne.

## Quickstart

1. Copy the `chanakya` bootstrap shim to your repo root.
2. Create a `.chanakya.json` pointing to this engine repo.
3. Run `./chanakya init` and follow the prompts.

## Goals

- **Consistency**: One source of truth for project conventions and architecture.
- **Signal**: Distilled knowledge instead of raw, noisy documentation.
- **Safety**: Canary checks to detect when an agent starts "hallucinating" or losing context.
- **Persistence**: Per-branch memory that carries context across chat sessions.
