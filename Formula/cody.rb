class Cody < Formula
  desc "Cody CLI - AINative Studio's AI-powered coding assistant"
  homepage "https://ainative.studio/cody"
  url "https://registry.npmjs.org/@ainative/cody-cli/-/cody-cli-0.12.86.tgz"
  version "0.12.86"
  sha256 "48775dd5189dc48b4145090793c081af36519a9c035fa48115a7c50cd948e6a5"
  license :cannot_represent

  depends_on "node"

  def install
    # Copy extracted package into libexec so npm install runs from the real path,
    # not a temp file: symlink that Homebrew deletes after extraction.
    # Fixes broken install: libexec/bin/cody not found. Refs cody-cli#120
    libexec.install Dir["*"]
    cd libexec do
      system "npm", "install", "--production", "--ignore-scripts"
    end
    (libexec/"bin").mkpath
    (libexec/"bin"/"cody").make_symlink libexec/"node_modules/@ainative/cody-cli/bin/cody.cjs"
    bin.write_exec_script (libexec/"bin"/"cody")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cody --version")
  end
end
