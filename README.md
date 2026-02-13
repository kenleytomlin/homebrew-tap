# Homebrew Tap for workspace-cli

This is a Homebrew tap for [workspace-cli](https://github.com/kenleytomlin/workspace-cli) — buildpacks for agent-friendly git repos.

## Installation

```bash
brew tap kenleytomlin/tap
brew install workspace
```

## Usage

```bash
workspace init my-project --stack fullstack-ts
cd my-project
workspace apply
```

## Update

```bash
brew update
brew upgrade workspace
```

## Uninstall

```bash
brew uninstall workspace
brew untap kenleytomlin/tap
```
