# Changelog

## [Unreleased]

### Changed

- **Breaking:** Compose aliases now use the `dc` prefix instead of `dcp` (e.g. `dcpu` → `dcu`, `dcpd` → `dcd`, `dcps` → `dcs`). The bare `dc` alias shadows the system `dc` calculator in interactive shells.

## [0.1.0] - 2026-04-16

### Added

- Initial release as **LDA — Logical Docker Aliases**
- `docker-lda.sh` with 37 aliases across 8 groups: Pull/Run, Container, Logs, Image, Volume, Compose, Management, System
- `lda` built-in alias to display all aliases in a formatted table
- `docker-lda-help.sh` help script with box-drawing characters and ANSI colors
- `setup.sh` one-line installer that adds a `source` entry to `.bashrc`
- README with alias reference table and install instructions
