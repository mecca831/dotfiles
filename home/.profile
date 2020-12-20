alias ls='ls -GFv'
alias kube-prod-west='kubectl --kubeconfig ~/kube-creds/kube-prod-west-136/kubeconfig'

HISTFILESIZE=1000000000
HISTSIZE=1000000

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
export -f parse_git_branch
export TZ=UTC
export PS1="\[\e[01;30m\][\A]\[\e[0m\]\`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\`\[\e[0m\] \[\e[00;33m\]\w\[\e[0m\] \[\e[00;32m\]\$(parse_git_branch)\[\e[0m\]$ "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export EDITOR='vim'
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA_OPTS="-Xms512m -Xmx2048m"
export PATH=$HOME/.nodebrew/current/bin:$PATH

##
# Your previous /Users/kcwu/.profile file was backed up as /Users/kcwu/.profile.macports-saved_2020-12-18_at_14:27:23
##

# MacPorts Installer addition on 2020-12-18_at_14:27:23: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2020-12-18_at_14:27:23: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

man() {
    LESS_TERMCAP_mb=$'\e'"[1;31m" \
    LESS_TERMCAP_md=$'\e'"[1;31m" \
    LESS_TERMCAP_me=$'\e'"[0m" \
    LESS_TERMCAP_se=$'\e'"[0m" \
    LESS_TERMCAP_so=$'\e'"[1;44;33m" \
    LESS_TERMCAP_ue=$'\e'"[0m" \
    LESS_TERMCAP_us=$'\e'"[1;32m" \
    command man "$@"
}

function lb() {
    mvim ~/logbook/$(date '+%Y-%m-%d').md
}

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kochihwu/.sdkman"
[[ -s "/Users/kochihwu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kochihwu/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
eval "$(fasd --init auto)"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
