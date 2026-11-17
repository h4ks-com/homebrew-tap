class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.3.3"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.3/kess-aarch64-apple-darwin.tar.gz"
      sha256 "7941fe0663f641b9f315670bfc34457b04b79fd396f105e52528b9902be1dc79"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.3/kess-x86_64-apple-darwin.tar.gz"
      sha256 "0f536071d3853dfd8f3786c3c1711d4b5f7b0980f1022d59ae6f1b7606a6e049"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.3/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4eb75085589d5df9a6638ab2b39d6189294b9cd43655c4c61c7e9c441e84d43"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.3/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5899b8d9ba29b38ec58dce0e4d5bbbe294120178bbf05e76128239210f478405"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
