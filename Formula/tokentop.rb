class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.7.0"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.7.0/ttop-darwin-arm64"
    sha256 "9ce59b40f61fac58864fa70c6ddc8b0e11f5d1d6048f3b7153464f355be11864"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.7.0/ttop-linux-arm64"
      sha256 "3944dca6b53a0e8894f4f58ec74073433a5a6b663cc388d821864d365aa6d57f"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.7.0/ttop-linux-x64"
      sha256 "bfeba67323c3ce8c6fe8a1b1a809bb361b14f48180476ed2b2c656b128a43d15"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
