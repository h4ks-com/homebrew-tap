class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.1.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.1/kess-aarch64-apple-darwin.tar.gz"
      sha256 "0c398cd58abb6665e409d276b9c54d294fdba3421d503b5fde4d44790f7e9c0a"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.1/kess-x86_64-apple-darwin.tar.gz"
      sha256 "46a283528a53ed1b1dd429d12c6089f40b888505d1ce0723fb532dbf3aefeb27"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.1/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a184842c644ac5324f2e5baa8ad46dfd198e5cdca5777159146942ddf96048c"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.1.1/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "656b61ff935b50bae3032b3ddda97037479704412ae86ed822c3767fa9e89ed5"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
