alias ls='ls -GFv'

HISTFILESIZE=1000000000
HISTSIZE=1000000

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
export -f parse_git_branch
export PS1="\[\e[01;30m\][\A]\[\e[0m\]\`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\`\[\e[0m\] \[\e[00;33m\]\w\[\e[0m\] \[\e[00;32m\]\$(parse_git_branch)\[\e[0m\]$ "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export EDITOR='vim'

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/kcwu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kcwu/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="/Users/kcwu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kcwu/.sdkman"
[[ -s "/Users/kcwu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kcwu/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

##
# Your previous /Users/kcwu/.profile file was backed up as /Users/kcwu/.profile.macports-saved_2020-12-18_at_14:27:23
##

# MacPorts Installer addition on 2020-12-18_at_14:27:23: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2020-12-18_at_14:27:23: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

#[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
eval "$(fasd --init auto)"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
