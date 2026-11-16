#!/usr/bin/env bash
# Write Formula/kess.rb for the latest kess release, from its attached archives.
set -euo pipefail

repo=h4ks-com/kess
tag=$(gh release view --repo "$repo" --json tagName --jq .tagName)
version=${tag#v}
archives=$(mktemp -d)
trap 'rm -rf "$archives"' EXIT
gh release download "$tag" --repo "$repo" --pattern 'kess-*.tar.gz' --dir "$archives"

url() { echo "https://github.com/$repo/releases/download/$tag/kess-$1.tar.gz"; }
sum() { shasum -a 256 "$archives/kess-$1.tar.gz" | cut -d ' ' -f 1; }

cat > Formula/kess.rb <<EOF
class Kess < Formula
  desc "Chess on a glossy 3D board in your terminal, against a bot or online"
  homepage "https://github.com/$repo"
  version "$version"
  license "GPL-3.0-or-later"

  on_macos do
    on_arm do
      url "$(url aarch64-apple-darwin)"
      sha256 "$(sum aarch64-apple-darwin)"
    end
    on_intel do
      url "$(url x86_64-apple-darwin)"
      sha256 "$(sum x86_64-apple-darwin)"
    end
  end

  on_linux do
    on_arm do
      url "$(url aarch64-unknown-linux-gnu)"
      sha256 "$(sum aarch64-unknown-linux-gnu)"
    end
    on_intel do
      url "$(url x86_64-unknown-linux-gnu)"
      sha256 "$(sum x86_64-unknown-linux-gnu)"
    end
  end

  def install
    bin.install "kess"
  end

  test do
    assert_match "open the start menu", shell_output("#{bin}/kess --help 2>&1", 2)
  end
end
EOF
echo "Formula/kess.rb now installs kess $version"
