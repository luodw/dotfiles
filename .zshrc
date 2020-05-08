# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/luodaowen/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#ZSH_THEME="dracula"
#ZSH_THEME="zeta"
ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  osx
  rust
  extract
  web-search
  git-flow
  encode64
  autojump
  colored-man-pages
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
   export EDITOR='mvim'
fi

bindkey \^U backward-kill-line

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="cd ~/.oh-my-zsh"
alias mydev="ssh luodaowen.backend@10.227.11.3"
alias todev="ssh root@10.225.245.31"
alias gohome="/Users/luodaowen/go/src/code.byted.org/tce"

alias help="tldr"
# alias git
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %Cblue[%ce]%Creset' --date=relative"
alias gshow="git show \$(git log --oneline  --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %Cblue[%ce]%Creset' | fzf | awk '{print \$1}')"
alias gitco="git checkout \$(git branch -ra | fzf)"
alias gitrs="git reset --hard \$(git branch -ra | fzf)"
alias diff='colordiff'
alias emacs="/usr/local/Cellar/emacs/26.2/bin/emacs"

# alias useful command
#alias cat='/usr/local/bin/bat'
#alias bat='/Users/luodaowen/go/bin/bat'
# alias ping=prettyping
alias preview="fzf --preview 'bat --color \"always\" {}'"
export FZF_DEFAULT_OPTS="--height 30% --reverse --border --bind 'alt-j:preview-down,alt-k:preview-up,alt-f:preview-page-down,alt-b:preview-page-up,ctrl-o:execute(vim {})'"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --follow --glob "!{.git,vendor}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias vtop="vtop -t gruvbox"
export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='+c -x'

export BAT_THEME="1337"
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

export EDITOR="nvim"
export PYTHONPATH="/Users/luodaowen/tce/tce_platform/src/platform_site"
export GOPATH="/Users/luodaowen/go"
export PATH="~/.cargo/bin:$GOPATH/bin:/Users/luodaowen/.nvm/versions/node/v10.14.2/bin:$PATH"
export PATH="$HOME/Library/Haskell/bin:/usr/local/sbin:$PATH"
export GOROOT="/usr/local/Cellar/go/1.13.3/libexec"
#export CONSUL_HTTP_HOST=10.12.21.89
# export GOPROXY=https://mirrors.aliyun.com/goproxy/
# export GOPROXY=https://goproxy.cn
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANG=zh_CN.UTF-8

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=003'

fpath+=~/.zfunc
[[ -s /Users/luodaowen/.autojump/etc/profile.d/autojump.sh ]] && source /Users/luodaowen/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

eval "`python -m pip completion --zsh`"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias www="python -m http.server  12345"
#export PATH="/usr/local/opt/node@10/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

autoload -U promptinit; promptinit
prompt pure

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export PATH="/usr/local/opt/gettext/bin:$PATH"
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"

function gi() { curl -sL https://www.gitignore.io/api/$@ ;}
