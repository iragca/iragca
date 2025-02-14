# Oh My Zsh! theme - partly inspired by:
# (1) https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/robbyrussell.zsh-theme
# (2) https://github.com/devcontainers/features/blob/main/src/common-utils/scripts/devcontainers.zsh-theme
__zsh_prompt() {
    local prompt_username
    if [ ! -z "${GITHUB_USER}" ]; then
        prompt_username="@${GITHUB_USER}"
    else
        prompt_username="%n"
    fi
    PROMPT="%{$fg[green]%}@${prompt_username} %(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[blue]%}%c%{$reset_color%}"
    PROMPT+=' $(git_prompt_info)'

    ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}(%{$fg[red]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}%1{$%}"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
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
