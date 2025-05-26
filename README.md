# dotfiles

My personal dotfiles.

## Required packages

- stow
- zsh
- zsh-completions
- zsh-autosuggestions
- zsh-syntax-highlighting
- fzf
- oh-my-zsh-git (AUR)
- tmux
- wl-clipboard
- git-delta

## zsh plugins

Also install [zsh-github-copilot](https://github.com/loiccoyle/zsh-github-copilot) as described in the `oh-my-zsh` section.

## Installation

There are currently two targets: `headless` and `desktop`.

### raptor

```bash
make [target]
```

## Uninstall

```bash
make uninstall-[target]
```
