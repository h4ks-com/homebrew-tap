#!/usr/bin/env bash
# Write Formula/katplay.rb for the latest katplay release, from its attached archives.
set -euo pipefail

repo=h4ks-com/katplay
tag=$(gh release view --repo "$repo" --json tagName --jq .tagName)
version=${tag#v}
archives=$(mktemp -d)
trap 'rm -rf "$archives"' EXIT
gh release download "$tag" --repo "$repo" --pattern 'katplay-*.tar.gz' --dir "$archives"

url() { echo "https://github.com/$repo/releases/download/$tag/katplay-$1.tar.gz"; }
sum() { shasum -a 256 "$archives/katplay-$1.tar.gz" | cut -d ' ' -f 1; }

mkdir -p Formula
cat > Formula/katplay.rb <<EOF
class Katplay < Formula
  desc "PlayStation Remote Play in your terminal"
  homepage "https://github.com/$repo"
  version "$version"
  license "AGPL-3.0-only"

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
    bin.install "katplay"
  end

  test do
    assert_match "usage: katplay", shell_output("#{bin}/katplay --help 2>&1", 1)
  end
end
EOF
echo "Formula/katplay.rb now installs katplay $version"
