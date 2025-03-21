# Basic config items ##########################################################
# use vim keybindings
export EDITOR=$(which nvim)
bindkey -v

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-history-substring-search

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Basic auto/tab complete: ####################################################
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)		# Include hidden files.

# Edit line in vim with ctrl-e: ###############################################
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Change cursor shape for different vi modes. #################################
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# My ALIASES ##################################################################
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias cls="clear"
alias gp="python3"
alias ver="python3 ~/ver.py"
alias mr="python3 ~/mr.py"
alias gr="go run"
alias th='touch'
alias md="mkdir -pv"                       # create needed parent folders, verify
alias mp='echo -e ${PATH//:/\\n} | less'   # show path, one entry per line
alias genv="printenv | grep -i"            # grep ENV variables for string ...
alias jnb="jupyter notebook"
alias jlb="jupyter lab"
alias gh="cd ~"
alias gb="cd /usr/bin"
alias tml="tmuxifier load-session"
alias tme="tmuxifier edit-session"
alias gdf="cd ~/Downloads/dotfiles"
# alias gdp="cd ~/dev/python && ls"
alias gs="git status"            # local repo status
alias gad="git add"               # stage specific file 
alias gal="git add -u"           # stage only modified and deleted files
alias gall="git add -A"          # stage ALL files
alias gl="git log"               # view detailed log
alias gll="git log --oneline"    # view summary, one line per commit
alias gpom="git pull origin main"
alias src="source ~/.zshrc"
alias srcx="xrdb ~/.Xresources"
alias ghx="history | grep"
alias grep="grep --color"
alias dg="ll | grep"
alias ga="grep ^alias ~/.zshrc"
alias gag="grep ^alias ~/.zshrc | grep -i"
# alias b="bat"
alias b='batcat'
alias ls="lsd -A --group-dirs first"
alias ll="lsd -lA --group-dirs first"
# alias ls="colorls -A --sd"
# alias ll="colorls -lA --sd"
alias fd="fdfind"
alias t2="tree -L 2 -adC"
alias tg="t2 | grep --before-context=2"
alias rgr="ranger"
alias y="yazi"
alias lg="lazygit"
alias nf="neofetch"
alias sdn="shutdown now"
alias ce="code"
alias mr="python3 ~/mr.py"
alias gr="go run"
alias gp="python3"
alias se="subl"
alias e="nvim"
alias v="vim"
alias x="exit"
alias tl="tldr"
alias tlf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
# alias fly="mcfly search"
alias fu="ncdu"
alias df="df -h"                    # show disk usage in human readable format
alias dusage="du -sh * 2>/dev/null" # summarize disk usage for each file in folder
alias pd="pushd"
alias d='dirs -v'
# alias ev='vim $(find . -type f | fzf --multi --preview "bat --color=always {}" --preview-window "~3")'
alias ev='vim $(find . -type f | fzf --multi --preview "bat --color=always {}")'
alias ex='./exp.sh'
alias efe='sh ~/efe.sh'
alias edf="vim -S ~/dotfiles.vim"
alias eil="e ~/.config/nvim/lua/user/init.lua"
alias enu="e ~/.config/nvim/lua/user ."
alias ef='e $(find . -type f | fzf -m)'
alias erc="e ~/.zshrc"
alias ep="e ~/.config/nvim/vim-plug/plugins.vim"
alias evi="e ~/.config/nvim/init.vim"
alias encf="e ~/.config/nvim ."

# for MacOs ...
# alias cda="conda deactivate"
# alias cac="conda activate py3.12.3"
# alias ci="conda install"
# alias ud="brew update && brew upgrade"

# for ubuntu-based distros ...
alias ud="sudo nala upgrade && sudo flatpak -y update"
alias pi="sudo nala install"
alias nar="sudo nala autoremove"

# for arch-based distros ...
# alias ud="sudo pacman -Syu"
# alias pi="sudo pacman -S"

# for fedora ...
# alias ud="sudo dnf -y upgrade"
# alias pi="sudo dnf -y install"

# My utility functions ########################################################
# who is listening on a port?
whoport () {
  num=${1:-$PORT}
  lsof -i -P | grep LISTEN | grep --color :$num
}

# so that lf will exit where you navigated to
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  # Original only takes filespec(s)
  # IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))

  # Mod to pass both dir to search in and filespec(s)
  IFS=$'\n' files=($(find "$1" -type f | fzf-tmux --query="$2" \
      --multi --select-1 --exit-0 \
      --preview "bat --color=always {}" \
      --preview-window=right,60%))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# --- fzf setup --- ###########################################################
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"
export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# --- fzf command defaults ---
export FZF_DEFAULT_COMMAND='fd . --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd . --type=d --hidden --strip-cwd-prefix --exclude .git'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

unalias zi                  # hack due to zinit alias v function conflict

# Shell integrations
# eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
