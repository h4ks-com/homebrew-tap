class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.3.5"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.5/kess-aarch64-apple-darwin.tar.gz"
      sha256 "d5ca902a75ba79558edfae24ea9a022b5375b1f71bd68acd83778aff2a2aa58b"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.5/kess-x86_64-apple-darwin.tar.gz"
      sha256 "6f640285772e01f8396f897a8d8e33c285a945a4555bb81b866c45e32d464e23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.5/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4bfdedb83b804a50821b69fad2db2e1f4d9c5bb6e2558ff5f73c95cb0f7b3929"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.5/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e36f3d67f5aa29b6fe6b4bc625efc841d4425ba8c75fc9fae42d46b89e0d9fb4"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
