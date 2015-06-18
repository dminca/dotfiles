#      _             _      _ _     
#     | |           (_)    | ( )    
#   __| | __ _ _ __  _  ___| |/ ___ 
#  / _` |/ _` | '_ \| |/ _ \ | / __|
# | (_| | (_| | | | | |  __/ | \__ \
#  \__,_|\__,_|_| |_|_|\___|_| |___/
# | | | |                           
# | |_| |__   ___ _ __ ___   ___    
# | __| '_ \ / _ \ '_ ` _ \ / _ \   
# | |_| | | |  __/ | | | | |  __/   
#  \__|_| |_|\___|_| |_| |_|\___|   
#                                   
#                                   
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%2c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
