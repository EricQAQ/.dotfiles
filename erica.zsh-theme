local ret_status="%(?:%{$fg_bold[green]%}»»:%{$fg_bold[red]%}»»)"
CURRENT_TIME="%{$fg[white]%}%{$fg[magenta]%}%D %T%{$fg[white]%}%{$reset_color%}"
PROMPT='‹$CURRENT_TIME› ${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) %{$fg[green]%}○"
