-gopath-fast-moving() {
  local i
  for i in "peco" "go"; do
    if ! type "$i" &>/dev/null; then
      cat <<EOT 1>&2
$i does not found in your \$PATH.
EOT
    return 1
    fi
  done

  if [[ -z "$GOPATH" ]]; then
    cat <<'EOT' 1>&2
$GOPATH is not set, go does not work properly on your machine?
EOT
  return 1
  fi

  cd $(ls -1d ${GOPATH}/src/*/*/* | peco)

  zle accept-line
  zle -R -c
}

autoload -Uz -- -gopath-fast-moving
zle -N -- -gopath-fast-moving

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
