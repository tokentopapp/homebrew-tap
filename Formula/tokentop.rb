class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.4.0"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.4.0/ttop-darwin-arm64"
    sha256 "ef458d76b898844b43bf8e1b7aaa63d4663eb875034ab201b13fb47b7b48c12a"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.4.0/ttop-linux-arm64"
      sha256 "60eac3659719da35684f5b1ae892af2f8af6832b0275d976dbed69aeccee8597"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.4.0/ttop-linux-x64"
      sha256 "0881e97328de04be3c4c0c3d99f5d9382a856cbf8aa1d14257810b6375821807"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
