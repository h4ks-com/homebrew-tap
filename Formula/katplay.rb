class Katplay < Formula
  desc "PlayStation Remote Play in your terminal"
  homepage "https://github.com/h4ks-com/katplay"
  version "0.1.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katplay/releases/download/v0.1.0/katplay-aarch64-apple-darwin.tar.gz"
      sha256 "05956645b2d468f30bcba654a774c141de76741c6ac8072d5063e7128f9b5ba8"
    end
    on_intel do
      url "https://github.com/h4ks-com/katplay/releases/download/v0.1.0/katplay-x86_64-apple-darwin.tar.gz"
      sha256 "df4b3a94af1d946dbc48373ee21f2a9a3798260924d42d14647c39496a01aa29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katplay/releases/download/v0.1.0/katplay-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b525e300bf9057c68ebdbdec71c6e603b2c0b769889c5a86acc9775c25de3ea"
    end
    on_intel do
      url "https://github.com/h4ks-com/katplay/releases/download/v0.1.0/katplay-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "77724dd54364d87dd1183f5a49e6a09010139ab198b5e0a0b1f9b8ef01215cac"
    end
  end

  def install
    bin.install "katplay"
  end

  test do
    assert_match "usage: katplay", shell_output("#{bin}/katplay --help 2>&1", 1)
  end
end
