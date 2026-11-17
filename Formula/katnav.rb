class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.3.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.3/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "0246d3e0489a875466fe0b3f0119e92c8806f0c64e95d58877e9b2cc90eaa9c6"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.3/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "962f9c50fd240d52caf583ab408f004da51c4aaf9c50ae272f5aed20f71a6615"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.3/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "319db3c2b4e46024be4491b143888d18cc72b867fffa98742c30f46efc4fdf40"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.3/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ab76e7c5fbb47956deb5198118f949726f43c8f54c40484222df350ff3e34685"
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
