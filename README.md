# homebrew-tap

Homebrew tap for the projects of [kevnnard](https://github.com/kevnnard).

Each package is its own project in its own repository. This tap only packages it, so the source, the history and the issues live in the project's repository.

- **Formula**: command-line tools, built from a tagged release. Lives in `Formula/`.
- **Cask**: macOS apps, downloaded from a release. Lives in `Casks/`.

## Install

```bash
brew tap kevnnard/tap
brew install kevnnard/tap/<formula>        # command-line tools
brew install --cask kevnnard/tap/<cask>    # macOS apps
```

## Packages

| Name | Type | What it is | Project |
|:---|:---|:---|:---|
| `dots` | formula | Cross-platform dotfiles manager, backup engine and machine provisioner. Also installs the alias `kevnnard-dots`. | [kevnnard/dots](https://github.com/kevnnard/dots) |
| `smartwindow` | cask | Polybar-style macOS top bar with numbered window tabs. | [kevnnard/smart-window](https://github.com/kevnnard/smart-window) |

### dots

```bash
brew install kevnnard/tap/dots
brew upgrade kevnnard/tap/dots
```

Install the latest unreleased `main` with `brew install --HEAD kevnnard/tap/dots`. Usage and commands are in the [dots README](https://github.com/kevnnard/dots#readme).

### smartwindow

```bash
brew install --cask kevnnard/tap/smartwindow
```

Usage and configuration are in the [smart-window repository](https://github.com/kevnnard/smart-window).

## Adding a package

1. Add the file to `Formula/` for a command-line tool, or to `Casks/` for a macOS app.
2. Point it at a tagged release of its own repository (`url`, `version`, `sha256` of that exact tarball or zip).
3. Add a row to the table above.
4. Check it: `brew install --build-from-source` for formulas, `brew install --cask` for casks.
