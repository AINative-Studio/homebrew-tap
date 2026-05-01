class Cody < Formula
  desc "Cody CLI - AINative Studio's AI-powered coding assistant"
  homepage "https://ainative.studio/cody"
  version "0.7.34"
  license :cannot_represent

  depends_on "ripgrep"

  on_macos do
    on_arm do
      url "https://github.com/AINative-Studio/cody-cli/releases/download/v0.7.34/cody-darwin-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/AINative-Studio/cody-cli/releases/download/v0.7.34/cody-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_DARWIN_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AINative-Studio/cody-cli/releases/download/v0.7.34/cody-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/AINative-Studio/cody-cli/releases/download/v0.7.34/cody-linux-x64.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_X64"
    end
  end

  def install
    bin.install "cody"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cody --version")
  end
end
