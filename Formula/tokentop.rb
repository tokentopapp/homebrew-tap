class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.6.1"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.6.1/ttop-darwin-arm64"
    sha256 "156f57a7f9f924442ef419945117b5b260286eed3aa26c168371859c4f560b27"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.6.1/ttop-linux-arm64"
      sha256 "d4e8d3de5af4a696cd16dd6590662f180faf0d864dde0ad4288842bfc14cf991"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.6.1/ttop-linux-x64"
      sha256 "0adca5d9f744c08971fb985377a739b7fd5a6f9099b45dc3061840b2b5851bad"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
