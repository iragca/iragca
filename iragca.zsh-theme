# Oh My Zsh! theme - partly inspired by:
# (1) https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme
# (2) https://github.com/devcontainers/features/blob/main/src/common-utils/scripts/devcontainers.zsh-theme

function virtenv_indicator {
    if [[ -z "$VIRTUAL_ENV" ]]; then
        psvar[1]=''
    else
        # Convert Windows path to Linux format (if needed)
        local venv_path="$VIRTUAL_ENV"
        if [[ "$venv_path" == *:*\\* ]]; then
            venv_path=$(wslpath -u "$venv_path")
        fi

        # Extract only the virtual environment name
        psvar[1]=$(basename "$venv_path")
    fi
}

add-zsh-hook precmd virtenv_indicator

__zsh_prompt() {
    local prompt_username
    if [ ! -z "${GITHUB_USER}" ]; then
        prompt_username="@${GITHUB_USER}"
    else
        prompt_username="%n"
    fi

    PROMPT="%(1V.(%1v).)%{$fg_bold[green]%}@${prompt_username} %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} )%{$fg[blue]%}%c%{$reset_color%}"
    PROMPT+=' $(git_prompt_info)'
    PROMPT+=$'\n'
    PROMPT+="%{$fg_bold[white]%}₱%{$reset_color%} "

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}%1{*%}%{$fg[cyan]%})"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
    ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg_bold[magenta]%}↓%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg_bold[magenta]%}↑%{$reset_color%}asdasd"
    ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg_bold[magenta]%}↕%{$reset_color%}"

    unset -f __zsh_prompt
}
__zsh_prompt

# Check if the terminal is xterm
if [[ "$TERM" == "xterm" ]]; then
    # Function to set the terminal title to the current command
    preexec() {
        local cmd=${1}
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${cmd}\007"
    }

    # Function to reset the terminal title to the shell type after the command is executed
    precmd() {
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${SHELL}\007"
    }

    # Add the preexec and precmd functions to the corresponding hooks
    autoload -Uz add-zsh-hook
    add-zsh-hook preexec preexec
    add-zsh-hook precmd precmd
fi
