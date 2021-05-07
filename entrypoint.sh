#!/bin/bash
set -euo pipefail
shopt -s nullglob

function process_entrypoint_files() {
  local f
  for f in $@; do
    case "$f" in
      *.sh)
        echo "$0: running $f"
        "$f"
        ;;
      *)
       echo "$0: Ignoring '$f'"
    esac
  done
}


process_entrypoint_files /entrypoint.d/*

eval "${@}"
