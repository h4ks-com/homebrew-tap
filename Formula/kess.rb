class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.0/kess-aarch64-apple-darwin.tar.gz"
      sha256 "0bd73bb01e90508c908dc040e6ac695cb221ee66efcfce1b48c6600c4d2f9bab"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.0/kess-x86_64-apple-darwin.tar.gz"
      sha256 "1a71d0f08fbc9bf333525b0b1e7792cb47d34fcbe2a29fd5b9c240497a821581"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.0/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9cd0d7fd23b3c11717bd6c5c00539f8a02c8d4096f9a1e7ce0d39837d25674ac"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.0/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96e19dbc7b154b4308b09debf3cfb0332031ef485726f709349a18beda681200"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
