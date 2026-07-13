# Changelog

All notable changes to the Chanakya framework will be documented in this file.

## [0.1.4] - 2026-07-13
### Added
- Canonical self-contained bootstrap shim (`templates/chanakya`).
- `update-framework` command for simple engine sync from `main`.
- `update` command repurposed for read-only project health checks.
- First-class Cursor skill templates (`templates/skills/`).
- Automated health pass in `init` and `update`.

### Changed
- Removed mandatory `.chanakya.json` requirement; defaults are now internal.
- Replaced `memory-bank` with optional `.chanakya/state/` model.
- Normalized all framework paths to use `.chanakya/`.
- Updated all documentation to reflect the new minimal footprint.

## [0.1.3] - 2026-07-13
### Added
- Comprehensive README and updated documentation.
- Improved CLI with explicit version management and bump commands.
- Updated templates for standard distribution.

## [0.1.2] - 2026-07-13
### Added
- Safe-sync update logic (no project-level git actions during updates).
- Engine synchronization tools in CLI.

## [0.1.1] - 2026-07-13
### Added
- Fetch original Ponytail rule from GitHub.
- Added vendor credits for external rules.

## [0.1.0] - 2026-07-13
### Added
- Initial standalone distribution structure.
- POSIX shell CLI with doctor and init commands.
- Generic templates for manifest, rules, and modes.
- Progress bar and UI library.
