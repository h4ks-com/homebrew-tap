class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.3.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.2/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "66fc2c14b81fe96aee5cb66b14cb2634b29a57a34bf9f51d4c2b010602cb9c4c"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.2/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "e238bb3679c94f39513ab0fb660383fe3f91d81840f53b61c03e85db9c39c068"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.2/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82780c43005727679d4a57b1552602582526116e41e5f4b81407aed99cfcc290"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.2/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8fc72a2a7a951d0a68716a86ff61b707a596124957225013375b000359fa0cd"
    end
  end

  # katnav loads CEF from beside its own executable, so the bundle stays whole
  def install
    if OS.mac?
      prefix.install "katnav.app"
      bin.write_exec_script prefix/"katnav.app/Contents/MacOS/katnav"
    else
      libexec.install Dir["katnav/*"]
      bin.write_exec_script libexec/"katnav"
    end
  end

  test do
    assert_match "usage: katnav", shell_output("#{bin}/katnav 2>&1", 1)
  end
end
