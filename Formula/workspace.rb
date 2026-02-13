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
      sha256 "597dc73e45e2aee31ffb9940ec5945c2ed1e466a91241a4252358f3677c554fe"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-x64.tar.gz"
      sha256 "ea3f28e2d13c45b5883c38e8cc59b9de33a0e2e8dbb0b45e550b8d4fa9a1ada8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "968815d312023282063ace8bbfa035833f6ad39d8e877b9c82cbaa34fab630ef"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "968815d312023282063ace8bbfa035833f6ad39d8e877b9c82cbaa34fab630ef"
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
