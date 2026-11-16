class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.0/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "90d34c8745cb6e2c46311622fa8a36c7e63ece92ef7b0b11ac9a6d3c10f44c5c"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.0/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "750c17ffd07abaf0a0823403b6ab7bc1b07224288b7948a980192a053f658424"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.0/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d395563955121ee3626b5b84a06a46b18698f25e1161919c58c724036119391f"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.3.0/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34d1123e98f87fcec559bdf34380d15309c7261ec387a2188725bc7cf420c185"
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
