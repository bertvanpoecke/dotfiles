# dotfiles

Bert's [dotfiles](https://dotfiles.github.io/) for macOS.

## Structure

```
dotfiles/
├── Brewfile          # All homebrew packages
├── install.sh        # Setup script
├── bin/              # Personal utilities (added to PATH)
├── fish/             # Fish shell config (stow package)
├── zsh/              # Zsh + Oh My Zsh config (stow package)
├── starship/         # Starship prompt config (stow package)
├── git/              # Git config (stow package)
├── macos/            # macOS defaults
├── vscode/           # VS Code settings
├── docs/             # Reference docs
└── local/            # Machine-specific overrides (gitignored)
```

## Installation

Create any [local overrides](#local-overrides) you need first, so `install.sh` symlinks them in the same pass.

```bash
git clone https://github.com/bertvanpoecke/dotfiles ~/projects/dotfiles
cd ~/projects/dotfiles
./install.sh
```

The install script will:
1. Install Homebrew (if missing)
2. Run `brew bundle` to install all packages
3. Install Oh My Zsh
4. Stow all packages to `$HOME`
5. Set zsh as the default shell

## How stow works

Packages are managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a "package". Running `stow <package>` from the dotfiles directory creates symlinks in `$HOME` that mirror the package structure.

Example: `fish/.config/fish/config.fish` → `~/.config/fish/config.fish`

## Local overrides

Machine-specific config that should never be committed goes in `local/` (gitignored).

- **zsh**: create `local/zsh/zshrc.local` — see `local/zsh/zshrc.local.example`; `install.sh` symlinks it to `~/.zshrc.local`
- **fish**: create `local/fish/local.fish` — see `local/fish/local.fish.example`
- **git**: create `local/git/gitconfig.local` — see `local/git/gitconfig.local.example`; `install.sh` symlinks it to `~/.gitconfig.local`, which `git/.gitconfig` includes (holds your `user.name`/`user.email`)
- **IDE**: set `IDE_CMD` to `cursor` or `code` (default: `code`); `c` opens paths in that editor
- **scripts**: place in `local/bin/` and reference from shell config

## Shells

- **zsh** is the default login shell with [Oh My Zsh](https://ohmyz.sh/) and [Starship](https://starship.rs/)
- **fish** is available as a secondary interactive shell, also using Starship

## macOS defaults

```bash
bash macos/defaults.sh
```
