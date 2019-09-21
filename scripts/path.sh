# Special PATH file for all PATH exports
PATH_RC="$HOME/scripts/.pathrc"

add_path () {
  if ! grep -Fq $1 $PATH_RC; then
    echo "export PATH=\"$1"':$PATH"' >> $PATH_RC
  fi
}
