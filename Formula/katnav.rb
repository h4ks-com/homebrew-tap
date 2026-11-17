class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.1/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "575bcb8dc98d3e5b3268ebd396834538e95884c1216ce394c6cf3200ac4b6d46"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.1/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "de6a18fe86993738613d06f4599bea0520a5dc8ab3e101994bfa0a6e6a35a915"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.1/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "984ae49b0afb0e8ce46d219f290d996450edd96356245f33ba13ac4658bdaf4c"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.1/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd37c2a9e6f09f32dec86dc6f0ad80b2691831db189e0ccf74b6a1f40fc31d90"
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
