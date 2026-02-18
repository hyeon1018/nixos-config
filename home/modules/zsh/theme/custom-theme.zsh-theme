VIRTUAL_ENV_DISABLE_PROMPT=true

function +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' && \
            -n $(git status --porcelain | grep -E '^\?\?' 2> /dev/null | tail -n1) ]]; then
        hook_com[unstaged]+="?"
    fi
}

function +vi-git-aheadbehind() {
    local ahead behind branch_name
    local -a gitstatus

    branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)

    ahead=$(git rev-list "${branch_name}"@{upstream}..HEAD 2>/dev/null | wc -l)
    (( ahead )) && gitstatus+=( "\xE2\x96\xB2${ahead// /}" )

    behind=$(git rev-list HEAD.."${branch_name}"@{upstream} 2>/dev/null | wc -l)
    (( behind )) && gitstatus+=( "\xE2\x96\xBC${behind// /}" )

    hook_com[misc]+=${(j::)gitstatus}
}

function +vi-git-stash() {
  local -a stashes

  if [[ -s $(git rev-parse --git-dir)/refs/stash ]] ; then
    stashes=$(git stash list 2>/dev/null | wc -l)
    hook_com[misc]+="\xE2\x97\x86${stashes// /}"
  fi
}

function _prompt_char() {
	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		echo "%{%F{blue}%}±%{%f%k%b%}"
	else
		echo ' '
			fi
}

function _prompt_virtualenv() {
	local virtualenv_path="$VIRTUAL_ENV"
	if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
		echo -n "%f(`basename $virtualenv_path`)%f "
	fi
}

function _prompt_git() {

	local color

	if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
		repo_path=$(git rev-parse --git-dir 2>/dev/null)
		if [[ -n $(parse_git_dirty) ]]; then
			color='yellow'
		else
			color='green'
		fi

		autoload -Uz vcs_info
		zstyle ':vcs_info:*' enable git
		zstyle ':vcs_info:*' get-revision true
		zstyle ':vcs_info:*' check-for-changes true
		zstyle ':vcs_info:*' stagedstr '+'
		zstyle ':vcs_info:*' unstagedstr '*'
		zstyle ':vcs_info:*' formats '[%7.7i] %b %u%c %m   '
		zstyle ':vcs_info:*' actionformats '%b [%a]  %u%c %m   '

		GIT_HOOKS=(git-untracked git-aheadbehind git-stash)
		zstyle ':vcs_info:git*+set-message:*' hooks $GIT_HOOKS
		vcs_info
		echo -n "%f > %F{${color}}${vcs_info_msg_0_%% }%f"
	fi
}

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
	light) bkg=white;;
	*)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%K{${bkg}} %n@%m > $(_prompt_virtualenv)%{%b%F{blue}%}%~%{%b%f%}$(_prompt_git)%E%{%f%k%b%}
 %(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)%{$reset_color%} '

RPROMPT=''
