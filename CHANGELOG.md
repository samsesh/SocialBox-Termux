# Changelog

## [v2.1.0] - 2026-06-19

### Fixed
- **install-sb.sh**: Added `safe_clone()` function to handle re-runs (git pull if dir exists, clone if not)
- **install-sb.sh**: Removed insecure `chmod 777 -R *` — replaced with targeted `chmod +x`
- **install-sb.sh**: Replaced deprecated `python2` with `python3` in apt dependencies
- **install-sb.sh**: Fixed wget URL (added `https://` prefix) for fb-brute.pl download
- **SocialBox.sh**: Changed `python2` to `python3` for Gemail-Hack and insta-bf
- **SocialBox.sh**: Added safe directory navigation with `cd ..` chaining
- Removed fikrado.py (Python 2, unmaintained since 2023)

### Added
- **Option 6**: Replaced fikrado.py with IAmBlackHacker/Facebook-BruteForce (Python 3, 2.2k stars, updated May 2024)
- **Option 7**: Added `igbf` (s41r4j/igbf) — modern Instagram brute forcer with proxy rotation, verbose mode, Python 3
- **Option 8**: Added `sosec` (samueleamato/sosec) — modern all-in-one toolkit supporting Instagram, Facebook, Gmail, and Twitter with TUI interface

### Updated
- **Gemail-Hack dependency**: Now fetches latest version (updated Mar 2026, Python 3 compatible)
- **README**: Not yet updated
