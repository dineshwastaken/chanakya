# Chanakya Lifecycle

A layman's guide to maintaining and using the framework.

## For the Maintainer (You)

1. **Improve**: Edit the engine logic in `bin/` or `lib/`, or update `templates/`.
2. **Version**: Increment `VERSION` and add a line to `CHANGELOG.md`.
3. **Release**: Tag your engine repo: `git tag vX.Y.Z && git push origin vX.Y.Z`.
4. **Notify**: Tell consumers to update their `.chanakya.json` or run `./chanakya update`.

## For the Consumer (Project Team)

1. **Install**: Run `./chanakya init`. This clones the engine into a hidden `.chanakya/` folder.
2. **Configure**: Set up your local machine paths in `.chanakya/repo-paths.properties`.
3. **Distill**: Run `./chanakya produce` once per section to build your knowledge base.
4. **Work**: Agents follow the rule in `.cursor/rules/chanakya.mdc`.
5. **Sync**: Occasionally run `./chanakya update` to get engine bugfixes.
