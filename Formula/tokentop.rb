class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.2.2"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.2.2/ttop-darwin-arm64"
    sha256 "010de16a37c3bfb9e29bd2d342bbd5c85f442b1958eba27fe6f6c35f71386da6"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.2.2/ttop-linux-arm64"
      sha256 "19bd3599c746704793f90054841fcc6542c4fba4b4fd3ea07560c81fbadbea70"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.2.2/ttop-linux-x64"
      sha256 "708395ec103bbea888245823e77180ffc6c57f289017b37ae3490dc08ead5b16"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
