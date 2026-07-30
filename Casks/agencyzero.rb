cask "agencyzero" do
  # The download URL carries no version on purpose: each release overwrites the
  # previous tarball, so the CDN holds one file rather than a growing pile. That
  # makes `version :latest` the only honest value here, and Homebrew requires
  # `sha256 :no_check` alongside it, because the bytes behind a fixed URL change.
  #
  # The consequence worth knowing: `brew upgrade` can never detect a new
  # release. It does not need to. The app carries Tauri's updater and pulls
  # itself forward from the same CDN, which is what `auto_updates` records.
  version :latest
  sha256 :no_check

  url "https://24x.ai/agencyzero/AgencyZero.app.tar.gz"
  name "AgencyZero"
  desc "Desktop harness for driving coding agents"
  homepage "https://github.com/pathscale/agencyzero"

  auto_updates true
  # arm64 only, deliberately. An Intel Mac would install this happily and then
  # fail to launch, so refuse at install time where the message is legible.
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "AgencyZero.app"

  # The bundle is ad-hoc signed, not notarized, so Gatekeeper rejects it and
  # Homebrew quarantines every cask artifact since 5.1 removed --no-quarantine.
  # Without this the app dies on first launch claiming to be damaged.
  #
  # Delete this block once the bundle is notarized: leaving it in would strip a
  # Gatekeeper check that users should get.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AgencyZero.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.pathscale.agencyzero",
    "~/Library/Caches/com.pathscale.agencyzero",
    "~/Library/Saved Application State/com.pathscale.agencyzero.savedState",
    "~/Library/WebKit/com.pathscale.agencyzero",
  ]
end
