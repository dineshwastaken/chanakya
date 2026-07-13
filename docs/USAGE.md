# Chanakya - Consumer Usage

This guide covers how to use Chanakya in your project.

## Daily Workflow

1. **Plan**: Use the "Plan (Chanakya)" Custom Mode to design your change. It will write a plan to local state.
2. **Implement**: Switch to "Implement (Chanakya)" to execute the plan.
3. **Verify**: The always-on rule will periodically check the canary to ensure context is still sharp.

## Commands

- `./chanakya status`: Show current framework health.
- `./chanakya update`: Run a project health pass to detect drift or missing files.
- `./chanakya update-framework`: Pull the latest engine features from the framework repo.
- `./chanakya scan`: Check for missing framework files.
- `./chanakya produce`: Distill more project knowledge.
- `./chanakya disable/enable`: Toggle the framework on or off.

## Safety

Chanakya never commits to your repo. It only suggests what to stage via `./chanakya suggest-commit`. You remain in full control of your git history.
