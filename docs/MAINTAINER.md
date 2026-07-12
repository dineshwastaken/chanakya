# Chanakya Maintainer Guide

This guide covers how to maintain and distribute the Chanakya framework.

## Initial Git Setup

If you haven't connected this folder to a remote repository yet, follow these steps:

1. **Create a Remote**: Create an empty repository named `Chanakya` on your personal GitHub account. Do not initialize it with a README or License.
2. **Initialize Local**:
   ```bash
   cd "/Users/dinesh.bandaru/Documents/Personal/Chanakya"
   git init
   git branch -M main
   ```
3. **Connect and Push**:
   ```bash
   git remote add origin git@github.com:<your-username>/Chanakya.git
   git add .
   git commit -m "Chanakya v0.1.0"
   git push -u origin main
   ```
4. **Tag for Distribution**:
   ```bash
   git tag v0.1.0
   git push origin v0.1.0
   ```

## Releasing Updates

1. **Edit**: Make changes to `bin/`, `lib/`, or `templates/`.
2. **Test**: Test the changes in a consumer project (like `toolbox-angular`).
3. **Version**: Update the `VERSION` file and add an entry to `CHANGELOG.md`.
4. **Tag**:
   ```bash
   git add .
   git commit -m "Release v0.2.0"
   git tag v0.2.0
   git push origin main --tags
   ```

## Distribution

Consumers reference your engine via `.chanakya.json`. They can update to your latest tagged release by running `./chanakya update`.
