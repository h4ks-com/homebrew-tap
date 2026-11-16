class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.2.1/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "8911312c1a5f4165cf24eba8ed6f7f505abff2f8a3ed77f756d3e34ba7359825"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.2.1/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "5491d95ef712eaf2ce000239ab1b8dfe92b6a1684261270900b6d660bf73af98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.2.1/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "700a07fdda4462a4862a171060dd481c72ca642bbad05e3b6eade3753c59d9f5"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.2.1/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bde7bd2eb3c59df3e802ce9b9bb73cdc474dd10730473f3f9d2f4575536ec470"
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
