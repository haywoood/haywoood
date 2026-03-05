# dotfiles

Config files and tools I use daily.

## What's in here

- **ghostty** — Terminal theme (Aura), JetBrains Mono, macOS native tabs
- **tmux** — `Ctrl+Space` prefix, git branch + dirty-file count in status bar, mouse mode
- **h** — Babashka CLI for team GitHub activity, PR reviews, worktree management
- **doom emacs** — Emacs config (`.doom.d/`)
- **zshrc / gitconfig** — Shell and git basics

## Setup

```sh
git clone git@github.com:haywoood/haywoood.git ~/dev/haywoood
cd ~/dev/haywoood && sh init.sh
```

`init.sh` symlinks everything into place. Safe to re-run.

**Note:** `h` expects a config at `~/.config/h/.env` — create it manually (not tracked, contains tokens).
