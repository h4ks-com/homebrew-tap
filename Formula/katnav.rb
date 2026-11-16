class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.1/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "c0cff48ae3214cf221cb63384fb5ae9fa12607ffbec5cadd32e2d8de6d53a61b"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.1/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "c996d3c803795e279cbaa91ddb852214bd36a92df3b88c548dcaacdf90235b89"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.1/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d8cde6d58aad9c21d14dd072472e1cc4a9b5d92d205b326c073e33e828d9fb2"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.1/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2ec1755f81a185dfe328993f730b606f08986f5d40c5143a9dfa1e64c83a2bc"
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
