class CargoVip < Formula
  desc "Use a private S3-compatible bucket as a Cargo registry, without running a server"
  homepage "https://cargo.vip"
  url "https://static.crates.io/crates/cargo-vip/cargo-vip-0.1.3.crate"
  sha256 "676c7d07b67dd2839c9f816a5059ceaa762d3e4048ff51a8306f7d0bafd7e79b"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cargo-vip --version")
  end
end
