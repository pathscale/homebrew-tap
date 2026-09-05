cask "agencyzero-experimental" do
  # The experimental channel follows the app's own updater. Its fixed CDN URL
  # therefore carries the newest experimental build rather than a versioned
  # archive that Homebrew compares itself.
  version :latest
  sha256 :no_check

  url "https://24x.ai/agencyzero-experimental/AgencyZeroExperimental.app.tar.gz"
  name "AgencyZero Experimental"
  desc "Experimental profile for the AgencyZero coding-agent desktop harness"
  homepage "https://github.com/pathscale/agencyzero"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "AgencyZero Experimental.app"

  # The bundle is ad-hoc signed until the application has a renewed Developer
  # ID and notarization path. Homebrew otherwise leaves quarantine in place and
  # macOS reports the application as damaged on first launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/AgencyZero Experimental.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.pathscale.agencyzero.experimental",
    "~/Library/Caches/com.pathscale.agencyzero.experimental",
    "~/Library/Saved Application State/com.pathscale.agencyzero.experimental.savedState",
    "~/Library/WebKit/com.pathscale.agencyzero.experimental",
  ]
end
