### CONSTANTS
DOTFILES_DIR=${HOME}/dotfiles
SECURE_DIR=${DOTFILES_DIR}/secure

function export_secure(){ F=${SECURE_DIR}/$1; [ -f $F ] && eval "export $1=$(cat $F)"; }



### HOMEBREW
export_secure HOMEBREW_GITHUB_API_TOKEN
export HOMEBREW_CASK_OPTS="--appdir=~/Applications"

### ROOT
. $(brew --prefix root5_pung)/libexec/set_root5.sh
. $(brew --prefix root6_pung)/libexec/set_root6.sh
alias rrb="root6 -b -q -l"

### ETC
export TERM="xterm-256color"

### BASHRC
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

### CLEAN UP
unset -f export_secure
