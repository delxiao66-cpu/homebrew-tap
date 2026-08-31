# Homebrew Tap

Personal Homebrew tap for software that is not available in the official Homebrew repositories and does not provide an upstream Homebrew tap.

## Usage

Add the tap:

```bash
brew tap <github-user>/tap
```

Install a cask:

```bash
brew install --cask <github-user>/tap/<cask-name>
```

Install a formula:

```bash
brew install <github-user>/tap/<formula-name>
```

## Repository Structure

```text
homebrew-tap/
├── Casks/
│   ├── openlca.rb
│   └── ...
└── Formula/
    └── ...
```

- `Casks/` contains GUI applications.
- `Formula/` contains command-line tools and libraries.
- Do not duplicate software that already exists in official Homebrew repositories or provides its own maintained tap.

## Adding a New Package

### 1. Clone the repository

```bash
GH_USER="$(gh api user --jq '.login')"

cd ~
gh repo clone "$GH_USER/homebrew-tap"
cd ~/homebrew-tap
```

### 2. Add a cask or formula

For a GUI application:

```bash
nano Casks/<app-name>.rb
```

For a command-line tool:

```bash
mkdir -p Formula
nano Formula/<tool-name>.rb
```

### 3. Validate

For a cask:

```bash
brew style Casks/<app-name>.rb
brew audit --cask Casks/<app-name>.rb
```

For a formula:

```bash
brew style Formula/<tool-name>.rb
brew audit --formula Formula/<tool-name>.rb
```

For personal taps, `brew audit` may report recommendations intended for submissions to the official Homebrew repositories. Review them, but syntax, installability, and package correctness are the primary concerns for personal use.

### 4. Commit and push

```bash
git add .
git commit -m "Add <package-name>"
git push
```

### 5. Install

For a cask:

```bash
brew install --cask "$GH_USER/tap/<app-name>"
```

For a formula:

```bash
brew install "$GH_USER/tap/<tool-name>"
```

### 6. Remove the temporary working copy

After the push and installation have been verified:

```bash
cd ~
rm -rf ~/homebrew-tap
```

The authoritative copy remains on GitHub, while Homebrew maintains its own tap clone under the Homebrew repository.

## Updating an Existing Package

Clone the repository again:

```bash
GH_USER="$(gh api user --jq '.login')"

cd ~
gh repo clone "$GH_USER/homebrew-tap"
cd ~/homebrew-tap
```

Edit the relevant cask or formula, validate it, then commit and push:

```bash
git add .
git commit -m "Update <package-name>"
git push
```

Refresh Homebrew and reinstall or upgrade as appropriate:

```bash
brew update
brew reinstall --cask "$GH_USER/tap/<package-name>"
```

For a formula, omit `--cask`.

Then remove the temporary working copy:

```bash
cd ~
rm -rf ~/homebrew-tap
```

## Maintenance Policy

Add a package to this tap only when:

1. it is not available from official Homebrew repositories;
2. the upstream project does not provide a maintained Homebrew tap; and
3. the package can be obtained from a trustworthy upstream source.

Whenever possible, casks and formulae should download directly from the software project's official release or distribution source rather than redistributing binaries in this repository.
