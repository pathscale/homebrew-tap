class CargoVip < Formula
  desc "Use a private S3-compatible bucket as a Cargo registry, without running a server"
  homepage "https://cargo.vip"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-aarch64-apple-darwin.tar.gz"
      sha256 "00aefabe6a8018df23e32c2fe0a04f48007dcaccfb855db6fa126e889e8c4156"
    end
    on_intel do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-x86_64-apple-darwin.tar.gz"
      sha256 "539133f73236c9eedb449bac938f2caf2dc384ab8eda398523ecedfe557ef926"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-aarch64-unknown-linux-musl.tar.gz"
      sha256 "db986b0725b267e216b468ce1d288308941de63efecfd56cd7f4140f2b633ab5"
    end
    on_intel do
      url "https://github.com/pathscale/cargo.vip/releases/download/v#{version}/cargo-vip-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a5ad7cb793f578b13b443c0e30356014c31d82c910724c1de0ad6d4f717c7a2d"
    end
  end

  def install
    # The tarball holds only bin/, and Homebrew stages inside a lone top-level
    # directory, so the binary is at the top here.
    bin.install "cargo-vip"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cargo-vip --version")
  end
end
