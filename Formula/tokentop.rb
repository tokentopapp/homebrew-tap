class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.3.0"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.3.0/ttop-darwin-arm64"
    sha256 "f4497418a6d5ae6417ebaa79bbd8c9a18093333e7eb7b18089622fd98ad628b2"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.3.0/ttop-linux-arm64"
      sha256 "1ac1538841388bbfb97f05d31c217e8ddc77b1eb5643686eb3b742f8ebd1d604"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.3.0/ttop-linux-x64"
      sha256 "9e0d71358b8ec19348411f2dfcfcd24d236270d14b84810dc1c5ce3d89041780"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
