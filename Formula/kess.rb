class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.0/kess-aarch64-apple-darwin.tar.gz"
      sha256 "2bb4d5eb13956a086d89a51417430c5c816899840f9d770e89142a68f94a3b8d"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.0/kess-x86_64-apple-darwin.tar.gz"
      sha256 "1f417331f0d5145f12104326d8c18e0f92915b91da834610983b9207bf41c164"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.0/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c54d961c404b5aa61ad2651b7173c752d3484d612344e48bc691f1499a44b1b"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.0/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8ac5e5e85f994d987a021ae3aa3d350d65f33bbcb408aab18e1152bc309208e1"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
