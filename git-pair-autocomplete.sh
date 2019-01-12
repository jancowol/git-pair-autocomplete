_git_pair_author_names() {
  local cur prev cmd
  cur="${COMP_WORDS[COMP_CWORD]}"
  cmd="${COMP_WORDS[1]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  echo "--------------------" >> ~/scratch/autocomp-test/completions
  echo "$cur / $prev / ${COMP_WORDS[*]}" >> ~/scratch/autocomp-test/completions
  echo "$COMP_CWORD" >> ~/scratch/autocomp-test/completions
  echo "$cmd" >> ~/scratch/autocomp-test/completions

  if [ ${COMP_CWORD} -ge 2 ] && [ "$cmd" == "set" ]; then
      # if (((${COMP_CWORD} == 2) && ("$prev" == "set"))); then
      local authors=$(cat git-pair-coauthors | paste -s -d" " -)
      local result=$(compgen -W "$authors" "$cur")
      COMPREPLY=($result)
  fi
}

complete -F _git_pair_author_names "gpair"
