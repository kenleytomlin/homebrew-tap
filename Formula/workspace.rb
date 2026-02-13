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
      sha256 "81fc8a4854e817ec612afdef2bd7059c82f7109373c30f6d5eaa64d23ec0420c"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-x64.tar.gz"
      sha256 "09312e8d3c2e2449df7db3e33c7b8c2459c6db749ff7bba9918af5833f06005d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "cdc3e4f98a984287c28cb18b39af578db177f15096d0ee3793baa99d81e7e34d"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "cdc3e4f98a984287c28cb18b39af578db177f15096d0ee3793baa99d81e7e34d"
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
