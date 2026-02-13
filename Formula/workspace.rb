# Homebrew formula for workspace-cli
# Install: brew tap kenleytomlin/tap && brew install workspace

class Workspace < Formula
  desc "Buildpacks for agent-friendly git repos"
  homepage "https://github.com/kenleytomlin/workspace-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-arm64.tar.gz"
      # sha256 will be updated after first release
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "workspace-darwin-arm64" => "workspace"
      else
        bin.install "workspace-darwin-x64" => "workspace"
      end
    else
      bin.install "workspace-linux-x64" => "workspace"
    end
  end

  test do
    assert_match "workspace v", shell_output("#{bin}/workspace --version")
  end
end
