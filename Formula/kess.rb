class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.2.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.2/kess-aarch64-apple-darwin.tar.gz"
      sha256 "422eed08a4a14c66eac63b4ae81763cabcb7eab19d5dc383ae0fd8eb34ed7683"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.2/kess-x86_64-apple-darwin.tar.gz"
      sha256 "af98f1f832f6b6ddfaf89d3f9c2d11b094b0464bb3538881f0a82b2f17d3b960"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.2/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08a03471ed3f6533b526ded98bb0c85598aad33e12eb514fdf850a99b7d9e7ae"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.2/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd6d45cb56f8d0b00df6f02f6f1c8286f9996bafdfe21f7312f11823ea1f2885"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
