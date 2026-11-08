# pathscale/homebrew-tap

Homebrew tap for pathscale software.

## agencyzero

Apple Silicon, macOS 11 or later.

```bash
brew tap pathscale/tap
brew trust pathscale/tap
brew install --cask agencyzero
```

The cask preserves macOS quarantine and Gatekeeper behavior. macOS continues to
apply its normal signature and notarization checks; an artifact that does not
pass those checks may be blocked.

`brew upgrade` will not update this cask. The app ships Tauri's updater and
pulls itself forward from the same CDN, which is what `auto_updates true`
records.
