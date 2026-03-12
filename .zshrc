# Path additions
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/dev/h/bin:$PATH"

# Server
export SERVER=${SERVER:-""}

# Dev environment launcher
# Customize PROJECT_DIR and server commands for your setup
dev() {
  local PROJECT_DIR="${DEV_PROJECT_DIR:-$HOME/dev/project}"

  # Attach if session exists
  if tmux has-session -t dev 2>/dev/null; then
    tmux attach -t dev
    return
  fi

  # Create new session
  cd "$PROJECT_DIR"
  tmux new-session -d -s dev -n "editing"

  # Window 0: Spacemacs below
  tmux split-window -t dev:editing -v "emacs -nw"
  tmux select-pane -t dev:editing.0  # focus top pane for claude

  # Window 1: Servers (customize these commands)
  # tmux new-window -t dev -n "servers" "npm run dev"
  # tmux split-window -t dev:servers -h "npm run watch"

  # Back to editing window, attach
  tmux select-window -t dev:editing
  tmux attach -t dev
}

# Completions
autoload -Uz compinit
compinit
zstyle ':completion:*' completer _complete _gnu_generic

# nnn file manager
alias f='nnn'

# nnn - use mpv for videos, emacs for text
export NNN_OPENER="$HOME/.config/nnn/opener.sh"

# fzf - Ctrl-R history, Ctrl-T files, Alt-C directories
source <(fzf --zsh)

# zoxide - smart cd (use 'z' instead of 'cd')
eval "$(zoxide init zsh)"

# direnv - auto-load .envrc per project
eval "$(direnv hook zsh)"

rmpv() {
  ssh $SERVER "yt-dlp -o - '$1'" | mpv -
}
export PATH="$HOME/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"

alias doom='emacs -nw --init-directory ~/.config/emacs'
