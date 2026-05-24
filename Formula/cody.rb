class Cody < Formula
  desc "Cody CLI - AINative Studio's AI-powered coding assistant"
  homepage "https://ainative.studio/cody"
  url "https://registry.npmjs.org/@ainative/cody-cli/-/cody-cli-0.8.27.tgz"
  version "0.8.27"
  license :cannot_represent

  depends_on "node"

  def install
    system "npm", "install", "--prefix", libexec, "--production", "--ignore-scripts", "."
    bin.write_exec_script (libexec/"bin/cody")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cody --version")
  end
end
