class Tokentop < Formula
  desc "htop for your AI costs - real-time terminal monitoring of LLM token usage"
  homepage "https://github.com/tokentopapp/tokentop"
  license "MIT"
  version "0.5.0"

  on_macos do
    url "https://github.com/tokentopapp/tokentop/releases/download/v0.5.0/ttop-darwin-arm64"
    sha256 "c7321fe651e0953b47b70b408a62b4db606887307f0c5a9a4b9fa67485b95853"
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.5.0/ttop-linux-arm64"
      sha256 "bd4af8573575cb8c83d8e0c733b8053f927bb858fbfa9530849ddb9a338596aa"
    else
      url "https://github.com/tokentopapp/tokentop/releases/download/v0.5.0/ttop-linux-x64"
      sha256 "4583bdf6c39d4c3a32baddfe5007ef1f1d1e6a6b09f38fa8398d0615c494c595"
    end
  end

  def install
    bin.install Dir["ttop-*"].first => "ttop"
  end

  test do
    assert_match "tokentop", shell_output("#{bin}/ttop --version")
  end
end
