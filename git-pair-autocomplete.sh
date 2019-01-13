__get_coauthors(){
    local _chums=$(git config --global --get-regexp ^chums)
    local _aliases=$(echo "$_chums" | cut -d. -f2- | cut -d " " -f1)
    __coauthors=$(echo "$_aliases" | paste -s -d" " -)
}

_git_pair_author_names() {
  local cur cmd __coauthors
  cur="${COMP_WORDS[COMP_CWORD]}"
  cmd="${COMP_WORDS[1]}"

  if [ ${COMP_CWORD} -ge 2 ] && [ "$cmd" == "set" ]; then
      __get_coauthors
      local options=$(compgen -W "$__coauthors" "$cur")
      COMPREPLY=($options)
  fi
}

alias gpair='git-pair'
complete -F _git_pair_author_names "gpair"
