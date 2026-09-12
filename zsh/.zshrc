# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme

export ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Wysa Env variables
export node_environment=local
export NODE_ENV=development
export firebase_key="{}"
export wysa_andriod_validation_key="{}"
export wysa_andriod_key="{}"
export bot_host=http://localhost:1337
export chat_secret=xxxy
export old_chat_secret=xxx
export api_secret=xxx
export PAT_TOKEN=xxxx
export SAML_CERT="xxxxxx"
export SSO_ACCENTURE_ACTIVE="true"
#export DEBUG="agenda:**"

# Aliases
alias startvpn="sudo openvpn /etc/openvpn/client/tirthb.ovpn"
alias vpnstatus="sudo systemctl status openvpn@tirthb-ovpn.service"
alias stopvpn="sudo systemctl stop openvpn@tirthb-ovpn.service"
alias cdsch="cd ~/work/scheduler"
alias cdchat="cd ~/work/SocketChat"
alias cdcoach="cd ~/work/coachdashboard-api"
alias cdtkapi="cd ~/work/touchkin-api"
alias cdbench="cd ~/work/databench"
alias gaction="gh run list -b \"development\" -w \"Deploy Dev\""
alias kitconf="nvim ~/.config/kitty/kitty.conf"
function mongoup() {
	cd ~/work
	docker compose -f docker-compose.yml up -d
	cd -
}
function mongodown() {
	cd ~/work
	docker compose -f docker-compose.yml down
	cd -
}

export SAVEHIST=1000
export HISTSIZE=5000
export HISTFILESIZE=5000
export HISTFILE=/home/wysa-tp/.zsh_history
export HISTCONTROL=ignoredups
export IGNORE_PAI=False
export WELLSAID_API_KEY=xxxx
export ASSEMBLY_AI_SECRET=xxxx
export GE_WEBHOOK_SECRET="xxxx"
export widgetChatSecret=xxxy
export CARTESIA_API_KEY="xxxxx"

export CARTESIA_API_VERSION="2024-06-10"
export BACKEND_API_URL="http://localhost:1337"

npmv() {
  if [[ "$1" =~ ^(patch|minor|major)$ ]]; then
    npm version "$1" --no-git-tag-version
  else
    echo "Usage: npmv [patch|minor|major]"
    return 1
  fi
}

gitpat() {
  grep -E "^$1\s*=" /home/wysa-tp/Documents/gitpat | sed -E 's/^[^=]+=\s*"([^"]+)".*/\1/'
}

agi() {
  ag "$1" --ignore-dir=wysadata --ignore-dir=wysadata70 --ignore-dir=wysavalkey --ignore-dir=wysaredis --hidden
}

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# opencode
export PATH=/home/wysa-tp/.opencode/bin:$PATH

#tmuxifier
export PATH="/home/wysa-tp/.config/tmux/plugins/tmuxifier/bin:$PATH"
alias vim="nvim"

# Force git, system utilities, and scripts to use neovim
export EDITOR="nvim"
export VISUAL="nvim"

# Keep vimdiff functionality intact with neovim
alias vimdiff="nvim -d"


function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

eval "$(zoxide init zsh)"

eval "$(tmuxifier init -)"

alias oo="z ~/Documents/obs/personal/"
alias ow="z ~/Documents/obs/work/"

# task warrior alias
alias ta='task add'
alias tl='task next'
alias te='task edit'
alias td='task done'
alias tm='task modify'
alias tc='task context'
alias tdt='task due:today list'
alias tconfig='vim ~/.taskrc'
alias health='cd ~ && ./essential_scripts/aws-health-tmux.sh && cd -'
alias refresh-ctags="git ls-files | ctags -L -"
alias cdmuxlayout="z ~/.config/tmux/plugins/tmuxifier/layouts/"
alias clip='xclip -selection clipboard'
alias cd='z'
alias calsync='vdirsyncer sync'
#neofetch
alias findpr="zsh /home/wysa-tp/essential_scripts/find_pr_by_author.sh"
alias d2id="node /home/wysa-tp/essential_scripts/old.js from-date"
alias id2dt="node /home/wysa-tp/essential_scripts/old.js from-id"

# alias for tmux
alias mx="tmux"
alias mxa="tmux a -t"
alias mxls="tmux ls"
alias mux="tmuxifier"
alias muxl="tmuxifier load-session"
alias muxe="tmuxifier edit-session"
