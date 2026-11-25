class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.3.4"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.4/kess-aarch64-apple-darwin.tar.gz"
      sha256 "2ee49b829e243e051ccc5cc161f03574eb24271eedafe5ffbb5b82aad8365781"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.4/kess-x86_64-apple-darwin.tar.gz"
      sha256 "3a0ddd568def93f35eb4a79aaadb6f73b87744ef0a4221ce27cbbc344a09f325"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.4/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61e29e9071b69c426c85a918ed76658e9bfdd829fdad339762eff9514ad12c5e"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.4/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20722d6b4b495b5b65a0f0fd768b9a94d8851f34afd3ad62e3838ef43422dfe5"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
