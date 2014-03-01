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


if [ -f `brew --prefix`/etc/autojump ]; then
    . `brew --prefix`/etc/autojump
fi
