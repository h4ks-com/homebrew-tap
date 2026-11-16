class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.2.3"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.3/kess-aarch64-apple-darwin.tar.gz"
      sha256 "7c0ffee36314ce380044bb8b2a50dc39e3b5f32515182498bf1ee17ec94fd90b"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.3/kess-x86_64-apple-darwin.tar.gz"
      sha256 "e12df2986e307838f98ed99bae7bd512a8fd01547b9c735fcbd8ccfc21ad2f1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.3/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e6d1ccf9ed0650255da673885c6853739fcfd72c34c98de59981fdba6998d2f"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.3/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eccbd0ac12c79c83bb3b130445770b9691a6a0bc05e0d2b22bd046abc0693969"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
