# typed: false
# frozen_string_literal: true

# This formula is auto-updated by the tokentop release workflow.
# Manual edits will be overwritten on the next release.

class Tokentop < Formula
  desc 'htop for your AI costs - real-time terminal monitoring of LLM token usage'
  homepage 'https://github.com/tokentopapp/tokentop'
  license 'MIT'
  version '0.1.0'

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v#{version}/ttop-darwin-arm64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v#{version}/ttop-darwin-x64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v#{version}/ttop-linux-arm64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v#{version}/ttop-linux-x64"
      sha256 '0000000000000000000000000000000000000000000000000000000000000000'
    end
  end

  def install
    bin.install Dir['ttop-*'].first => 'ttop'
  end

  test do
    assert_match 'tokentop', shell_output("#{bin}/ttop --version")
  end
end
