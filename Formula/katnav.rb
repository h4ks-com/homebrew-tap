class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.3.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.4/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "d80cf0b01b3addc5d405bc759e8e71b12f8f08af6311151e14dbc11b3e5dc561"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.4/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "acd4ccb43b31066cd0c78d5aeb422d199f2384d3fee849082e3aca2b358c4653"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.4/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "643f48fc462ab19002a15a9f982f35b91102f6934aa3c19dd601267de470ed52"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.4/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c43a8e227e98d4cefa7a74687c5b5dbfd5c69194bca1ae63b10e1bfc5ed4af8a"
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
