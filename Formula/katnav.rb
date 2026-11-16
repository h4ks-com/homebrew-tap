class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.2/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "c3dc9fc6c421e1b2e96e5edf70b4bbc33fa6472c6b69cee5fa4fb346f4a08739"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.2/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "a10712cb8bacc5a70e3f22b73eaffcb3605ae40a93ebc168a2f6484246382db4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.2/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43d2fbc1aca9fd7c9ab85b413cf644bc631d192e8dccd08d333b626f23733c68"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.2/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac27c9869b539c3758c71e2435c5e8c11493574b2c652ea86524f22362ceff2f"
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
