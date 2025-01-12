
setopt NO_BEEP
setopt AUTO_CD


bindkey "^[OA" up-line-or-search ## up arrow for back-history-search
bindkey "^[[B" down-line-or-search ## down arrow for fwd-history-search

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

setopt NO_AUTO_MENU
setopt histexpiredupsfirst histfindnodups sharehistory
setopt histignoredups histnostore histverify histignorespace
setopt HIST_IGNORE_ALL_DUPS

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME"/.zsh_history


#start set color grate
PROMPT=$(echo '%m%B%{\033[32m%}%~#%{\033[37m%}')  

if [ "$(id -u)" = "0" ];then
	PROMPT=$(echo '%m%B%{\033[31m%}%~#%{\033[37m%}')
fi

#if [ "$(echo $(who am i)|awk '{print $1}')" != "root" ];then
#	PROMPT=$(echo '%m%B%{\033[32m%}%~#%{\033[37m%}')
#fi
#end set color grate


alias ll='ls -l'
alias h='history 1'
alias -g g='| grep -i'
alias -g t='| tail'


#cd "$HOME"
#export DISPLAY=":0.0"
#export DISPLAY=:1001

PATH=$PATH:/opt/local/bin; export PATH
PATH=$PATH:/opt/lampp/bin; export PATH
PATH=$PATH:"$HOME"/bin; export PATH
PATH=$PATH:/opt/homebrew/bin; export PATH

PATH=$PATH:"$HOME"/miniconda3/bin; export PATH


export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ruslansemenyuk/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ruslansemenyuk/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ruslansemenyuk/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ruslansemenyuk/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

