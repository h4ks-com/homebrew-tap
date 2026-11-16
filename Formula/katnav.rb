class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/h4ks-com/katnav"
  version "0.1.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.4/katnav-aarch64-apple-darwin.tar.gz"
      sha256 "eb3b440cede5edf3fceec0e0e82bfe2157e05fb5271c26f7bfb6d661edf0653e"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.4/katnav-x86_64-apple-darwin.tar.gz"
      sha256 "150cec687d733ca51d5be475349b3112da17f10ff99bae0570c2251523dcd46f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.4/katnav-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02213765ddac2fb12310edb3152f4bc193700c48d1a6b79cbcf2da6f69937e21"
    end
    on_intel do
      url "https://github.com/h4ks-com/katnav/releases/download/v0.1.4/katnav-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10e81434f33fc73ad6627fa7ca75583e825664c6fb313a6878e873331d9c9fcb"
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
