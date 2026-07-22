# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.7.0] - 2026-07-22

### Changed
- `write_maximum_nest_counts_as_same_site()` now accepts `island` as a single comma-separated string (e.g., `"Bledos,Patos"`) instead of multiple `island` list entries. This is a breaking change to the function's API. This is the standard workaround and what most `optparse` CLIs do.

## [0.6.0] - 2026-07-21

### Added
- Function `write_maximum_nest_counts_as_same_site()` that computes maximum nest counts treating two islands as a single site.

### Changed
- `write_concatenated_counts()` now sorts output by island and season.

## [0.5.0] - 2026-07-15

### Added
- Function `write_concatenated_counts()` that concatenates historical, high counts, and nests counts data.

### Changed
- `get_domain_specific_options()` now returns additional CLI options: `historical-data-path`, `high-counts-path`, and `nests-counts-path`.

## [0.4.0] - 2025-11-05

### Added
- Function `write_figure_metadata()` that writes metadata for figures using data.
- Function `get_domain_specific_options()` allow to use domain specific options.

## [0.3.1] - 2023-08-22

### Fixed
- Exclude Coronado Sur and Norte from Pacific islands.

## [0.3.0] - 2023-08-21

### Added

- Add `write_summary_by_season()`

## [0.2.0] - 2023-08-18

### Added

- Add `select_pacific_islands_cli()`
- Add `select_california_islands_cli()`

## [0.1.0] - 2023-06-06


[unreleased]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.7.0...HEAD
[0.7.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.3.1...v0.4.0
[0.3.1]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.3.0...v0.3.1
[0.3.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/IslasGECI/clean_dcco_data/compare/v0.0.0...v0.1.0
