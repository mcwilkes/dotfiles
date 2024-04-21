# Powerlevel10k INITIAL setup (more at end) ###################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Basic config items ##########################################################
# use vim keybindings
export EDITOR=$(which nvim)
bindkey -v

plugins=(   git 
            vi-mode 
            themes 
            history-substring-search)

# source $ZSH/oh-my-zsh.sh
source $(dirname $(gem which colorls))/tab_complete.sh

# User configuration ##########################################################
PROMPT='[%B%F{blue}%3~%f] ${vcs_info_msg_0_}
%F{magenta}%  >>%f %F{yellow}%>>'

# source MCWs plugins #########################################################
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /Users/mcwilkes/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh
source /Users/mcwilkes/.config/lf/lficons.conf 2>/dev/null

# map up/down arrow keys for history search ###################################
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Basic auto/tab complete: ####################################################
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

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

################# HIDE a bunch of zsh (mostly comments) #######################
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/mcwilkes/.oh-my-zsh"

export LSCOLORS="ExFxBxDxegedabagacad"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 3

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# VCS setup ###################################################################
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %b'
setopt PROMPT_SUBST

################# HIDE a bunch of zsh (mostly comments) #######################
#autoload -U colors && colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%} @ %{$fg[blue]%}Air %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%} $%b "
#PROMPT='[%F{blue}%~%f] %F{magenta}% >>%f %F{yellow}% '

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# My ALIASES ------------------------
alias cls="clear"
alias gh="cd ~"
alias gb="cd /usr/bin"
alias gdf="cd ~/Downloads/dotfiles"
# alias gdp="cd ~/dev/python && ls"
alias gpom="git pull origin main"
alias src="source ~/.zshrc"
alias ghx="history | grep"
alias grep="grep --color"
alias dg="ll | grep"
alias ga="grep ^alias ~/.zshrc"
alias b="bat"
# alias b='batcat'
alias ls="lsd -A --group-directories-first"
alias ll="lsd -lA --group-directories-first"
# alias ls="colorls -A --sd"
# alias ll="colorls -lA --sd"
alias fd="fdfind"
alias t2="tree -L 2 -adC"
alias tg="t2 | grep --before-context=2"
alias rgr="ranger"
alias lg="lazygit"
alias nf="neofetch"
alias sdn="shutdown now"
alias ce="code"
alias se="subl"
alias e="nvim"
alias v="vim"
alias x="exit"
alias tl="tldr"
alias tlf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
# alias fly="mcfly search"
alias fu="ncdu"
alias pd="pushd"
alias d='dirs -v'
# alias ev='vim $(find . -type f | fzf --multi --preview "bat --color=always {}" --preview-window "~3")'
alias ev='vim $(find . -type f | fzf --multi --preview "bat --color=always {}")'
alias ex='./exp.sh'
alias efe='sh ~/efe.sh'
alias erc="e ~/.zshrc"
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
# alias dc="conda deactivate"
# alias ud="brew update && brew upgrade"

# for ubuntu-based distros ...
alias ud="sudo nala upgrade && sudo flatpak -y update"
alias pi="sudo nala install"
alias nar="sudo nala autoremove"

# for arch-based distros ...
# alias ud="sudo pacman -Syu"
# alias pi="sudo pacman -S"

# for fedora ...
# alias ud="sudo dnf upgrade"
# alias pi="sudo dnf install"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Powerlevel10k FINAL setup ###################################################
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(zoxide init zsh)"
alias fd="fdfind"
alias ls="colorls -A --sd"
alias ll="colorls -lA --sd"
# alias ls="lsd -A --group-directories-first"
# alias ll="lsd -lA --group-directories-first"
alias sdn="shutdown now"
alias ef='e $(find . -type f | fzf -m)'
# alias b='batcat'
alias erc="e ~/.zshrc"
alias ep="e ~/.config/nvim/vim-plug/plugins.vim"
alias evi="e ~/.config/nvim/init.vim"
alias encf="e ~/.config/nvim ."
alias gd="cd ~/dev/work && lsc"
alias tl="tldr"
alias tlf='tldr --list | fzf --preview "tldr {1} --color=always" --preview-window=right,70% | xargs tldr'
alias d='dirs -v'
alias pd='pushd'

# These are for ubuntu-based distros ...
alias ud="sudo nala upgrade && sudo flatpak -y update"
alias pi="sudo nala install"
alias nar="sudo nala autoremove"

# These are for arch-based distros ...
# alias ud="sudo pacman -Syu"
# alias pi="sudo pacman -S"

# for fedora ...
# alias ud="sudo dnf upgrade"
# alias pi="sudo dnf install"
