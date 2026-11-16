class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/h4ks-com/kess"
  version "0.3.1"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.1/kess-aarch64-apple-darwin.tar.gz"
      sha256 "8289f873c594344fd86804b94f51a90a0290ee80ee059710acf1a1aceb1349e5"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.1/kess-x86_64-apple-darwin.tar.gz"
      sha256 "fb4480b77ff5ca11547246c84d47803de222902f6336f555873a2d3107fb03a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.1/kess-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0bfff6991d642bbf5593b62d2efb150028813ee1463eeeac2fda9d2359b9d584"
    end
    on_intel do
      url "https://github.com/h4ks-com/kess/releases/download/v0.3.1/kess-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c04c162ce8ba2dc4dd5cf65248203899709c8f82b9f9d480d57843c0e22ddba"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
