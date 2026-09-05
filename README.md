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

## AgentCode

Apple Silicon, macOS 11 or later.

```bash
brew tap pathscale/tap
brew trust pathscale/tap
brew install --cask agentcode
```

The cask installs and starts the persistent user service. The client and daemon
share `~/Library/Application Support/com.pathscale.agentcode` by default:

```bash
codeserver status
```

### Why the cask looks the way it does

The bundle is ad-hoc signed rather than notarized, so Gatekeeper rejects it. The
cask strips the quarantine flag after install, because Homebrew applies it to
every cask artifact and without the strip macOS reports the app as damaged on
first launch. For the same reason a browser download of the same tarball will
**not** work, which is why this tap is the only supported install route for now.

`brew upgrade` cannot detect a new AgentCode archive because the fixed download
URL has no comparable version. Use `brew reinstall --cask agentcode`; the cask
stops and removes the old user service before installing and starting its
replacement.

## AgencyZero Experimental

The experimental profile installs beside the standard application and keeps a
separate application-support directory and updater channel:

```sh
brew install --cask pathscale/tap/agencyzero-experimental
```
