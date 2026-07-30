# pathscale/homebrew-tap

Homebrew tap for pathscale software.

## agencyzero

Apple Silicon, macOS 11 or later.

```bash
brew tap pathscale/tap
brew trust pathscale/tap
brew install --cask agencyzero
```

The `brew trust` step is not optional. Homebrew refuses to load a cask from a
third-party tap until the tap is trusted, and the error it prints if you skip it
names the fix.

### Why the cask looks the way it does

The bundle is ad-hoc signed rather than notarized, so Gatekeeper rejects it. The
cask strips the quarantine flag after install, because Homebrew applies it to
every cask artifact and without the strip macOS reports the app as damaged on
first launch. For the same reason a browser download of the same tarball will
**not** work, which is why this tap is the only supported install route for now.

`brew upgrade` will never update this cask. The download URL carries no version,
so `version :latest` is the only honest value and Homebrew cannot compare
releases. The app ships Tauri's updater and pulls itself forward from the same
CDN instead, which is what `auto_updates true` records.
