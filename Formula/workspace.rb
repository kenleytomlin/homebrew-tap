# Homebrew formula for workspace-cli
# Install: brew tap kenleytomlin/tap && brew install workspace

class Workspace < Formula
  desc "Buildpacks for agent-friendly git repos"
  homepage "https://github.com/kenleytomlin/workspace-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-arm64.tar.gz"
      sha256 "0c20d8b11b774efb86d9141e56b23f2880507e9893d8050507a1d42fad96397b"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-darwin-x64.tar.gz"
      sha256 "43629ac82476b30b8ad05f6342cda06c43d7e6838b56f95122385db1d164350b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "17237a8b036200b90f273f9765e3bcec7667c9706a554428905161bac900265a"
    end
    on_intel do
      url "https://github.com/kenleytomlin/workspace-cli/releases/download/v#{version}/workspace-linux-x64.tar.gz"
      sha256 "17237a8b036200b90f273f9765e3bcec7667c9706a554428905161bac900265a"
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
