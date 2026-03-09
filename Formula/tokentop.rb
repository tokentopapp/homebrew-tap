class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.6.0"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.6.0/ttop-darwin-arm64"
    sha256 "f7995fa3f6487bbe67399f3034749ea59267243f9d5a7779e85b69f1a6f84a73"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.6.0/ttop-linux-arm64"
      sha256 "580f078798a3931f8652e6a35c66480bd0d651bf563d68a80167569311882e45"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.6.0/ttop-linux-x64"
      sha256 "07efa17898d47fb11291959ea748370b11c38376f01332e6a61d4823fed462cf"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
