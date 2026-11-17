class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.3.2"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.2/kess-aarch64-apple-darwin.tar.gz"
      sha256 "a2f111505bf3d97773232e22ec337c117f111e9ff492ba2d82650d05c3753040"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.2/kess-x86_64-apple-darwin.tar.gz"
      sha256 "dcc1deef8784ddd8c159dc4244458afa9019dbfb5decc97d673c1e3e9de2431e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.2/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ddf838f64101fa41a78b6a0dd719b566555f69763775b67f437aca1a378b1add"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.2/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3df2722d351cf9ffc166e061cffdfed04bc460961148133b44e87f4896c0cc8"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
