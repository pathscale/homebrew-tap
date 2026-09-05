cask "agentcode" do
  # AgentCode is distributed from a fixed CDN path while releases remain
  # private. Reinstalling the cask fetches the current signed archive.
  version :latest
  sha256 :no_check

  url "https://24x.ai/agentcode/AgentCode-aarch64-apple-darwin.tar.gz"
  name "AgentCode"
  desc "Persistent semantic workspace for coding agents"
  homepage "https://github.com/pathscale/agentcode"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  binary "agentcode"
  binary "codeserver"

  # The two Mach-O executables are ad-hoc signed rather than notarized.
  # Homebrew quarantines cask downloads, so clear that attribute before first
  # execution or Gatekeeper reports the binaries as damaged.
  postflight_steps do
    run "/usr/bin/xattr",
        args: [
          "-dr",
          "com.apple.quarantine",
          "{{staged_path}}/agentcode",
          "{{staged_path}}/codeserver",
        ]
    run "{{staged_path}}/codeserver", args: ["install"]
    run "{{staged_path}}/codeserver", args: ["start"]
  end

  uninstall_preflight_steps do
    run "{{staged_path}}/codeserver",
        args:         ["stop"],
        must_succeed: false
    run "{{staged_path}}/codeserver",
        args:         ["uninstall"],
        must_succeed: false
  end

  zap trash: "~/Library/Application Support/com.pathscale.agentcode"
end
