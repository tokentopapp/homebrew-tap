class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.2.1"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.2.1/ttop-darwin-arm64"
    sha256 "44753a6d60143866db00ea47a654054c98d954bdabb4fe01514c39e4eaaca721"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.2.1/ttop-linux-arm64"
      sha256 "cf0ff5b4f12a9b4f1e0aa437ea951f1eb70b7a2341b83cb2b4dd5cf6f5328b3a"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.2.1/ttop-linux-x64"
      sha256 "0b36db6f083f27c5c002bd67e9fb6bf56f30041ccabe0902f5a92fd9b448d144"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
