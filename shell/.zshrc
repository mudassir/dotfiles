## Sh
export PATH=/usr/local/sbin:${PATH}
export EDITOR=vi
alias ls='ls -GFh'
alias ll='ls -la'
set -o vi

## Zsh
# For bash-like wildcard operation
setopt nonomatch
# Command completion
autoload -Uz compinit && compinit
# Tab selection
zstyle ':completion:*' menu select
# History completion
# https://wiki.archlinux.org/index.php/zsh#Key_bindings
typeset -g -A key
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
# Coloured man pages
# https://wiki.archlinux.org/index.php/Color_output_in_console
man() {
  LESS_TERMCAP_mb=$'\E[1;31m' \
  LESS_TERMCAP_md=$'\E[1;36m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[01;44;33m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[1;32m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  command man "$@"
}

## Homebrew
# https://github.com/settings/tokens
export HOMEBREW_GITHUB_API_TOKEN=?
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_EDITOR=vi
