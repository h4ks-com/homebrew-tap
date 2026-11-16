class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.2.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.1/kess-aarch64-apple-darwin.tar.gz"
      sha256 "8fc353446e8eb3bab42d16a85432e7b101d6e51c131de80bc796f060e52b6ee6"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.1/kess-x86_64-apple-darwin.tar.gz"
      sha256 "092f7cf876c8312bf878be09d48a02c3099c281ad3836f5406a74c43961c512c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.1/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dfc702955f4478f79ab953052225b3959a2f0822fa727be3bcbe9f10d4c7af32"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.2.1/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed6fc6ef691877d87ec358dc11922a8a7b195f2a1b8537429dc12cb74f30f85e"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
