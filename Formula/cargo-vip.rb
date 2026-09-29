class CargoVip < Formula
  desc "Use a private S3-compatible bucket as a Cargo registry, without running a server"
  homepage "https://cargo.vip"
  version "0.1.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-aarch64-apple-darwin.tar.gz"
      sha256 "46bc1a5d01b81310d9723b80df2db0f17b48fd480954d19a5179c26507f63813"
    end
    on_intel do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-x86_64-apple-darwin.tar.gz"
      sha256 "268dd026afa0bc17ec4d7e611834bb17546fad0fb01d162351c19736eb23b95b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f9436c5fccfc8bc3efa3a591db484630e47c6ff288bd931e6aa26c234915eecb"
    end
    on_intel do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-x86_64-unknown-linux-musl.tar.gz"
      sha256 "723b7e30698ac1909b7117727fe8bded1a07c531095604ccaf20103dfcbe2c95"
    end
  end

  def install
    bin.install "bin/cargo-vip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cargo-vip --version")
  end
end
