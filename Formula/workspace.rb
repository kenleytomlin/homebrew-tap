# Homebrew formula for workspace-cli
# Install: brew tap kenleytomlin/tap && brew install workspace

class Workspace < Formula
  desc "Buildpacks for agent-friendly git repos"
  homepage "https://github.com/kenleytomlin/workspace-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-arm64.tar.gz"
      sha256 "8d697fad93941e8e08ed22b3bb0bbe2ff4b489d77f5a68c8b82eb1e4572a0372"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-x64.tar.gz"
      sha256 "09ef3bfa062c7958829a95d41399face8204cd2cf09d093925e53dec00075cbf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "b264901ccac13c58b8a49b0c4dbcb5f1ce7dca1e6327c5f219352977670786f5"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "b264901ccac13c58b8a49b0c4dbcb5f1ce7dca1e6327c5f219352977670786f5"
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
