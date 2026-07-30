# pathscale/homebrew-tap

Homebrew tap for pathscale software.

```bash
brew tap pathscale/tap
brew install --cask agencyzero
```

## agencyzero

Apple Silicon, macOS 11 or later. The bundle is ad-hoc signed rather than
notarized, so the cask strips the quarantine flag after install; without that
macOS reports the app as damaged on first launch. A browser download of the same
tarball will **not** work for the same reason, which is why this tap is the only
supported install route for now.

Updates are not handled by `brew upgrade`. The app ships Tauri's updater and
pulls itself forward from the CDN, so the cask is pinned to `version :latest`
and never needs a commit per release.
