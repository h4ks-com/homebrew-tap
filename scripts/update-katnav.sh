#!/usr/bin/env bash
# Write Formula/katnav.rb for the latest katnav release, from its attached archives.
set -euo pipefail

repo=h4ks-com/katnav
tag=$(gh release view --repo "$repo" --json tagName --jq .tagName 2>/dev/null) || {
  echo "katnav has no release yet"
  exit 0
}
version=${tag#v}
archives=$(mktemp -d)
trap 'rm -rf "$archives"' EXIT
gh release download "$tag" --repo "$repo" --pattern 'katnav-*.tar.gz' --dir "$archives"

url() { echo "https://github.com/$repo/releases/download/$tag/katnav-$1.tar.gz"; }
sum() { shasum -a 256 "$archives/katnav-$1.tar.gz" | cut -d ' ' -f 1; }

mkdir -p Formula
cat > Formula/katnav.rb <<EOF
class Katnav < Formula
  desc "Web browser for the terminal, drawn with the kitty graphics protocol"
  homepage "https://github.com/$repo"
  version "$version"
  license any_of: ["MIT", "Apache-2.0"]

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
EOF
echo "Formula/katnav.rb now installs katnav $version"
