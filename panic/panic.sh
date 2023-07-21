#!/bin/bash

function panic() {
  local key=""
  local message=""
  local code=""

  while [ $# -gt 0 ]; do
    case "$1" in
      "--key"|"-k")
        key="$2"
        shift
        shift
      ;;
      "--message"|"-m")
        message="$2"
        shift
        shift
      ;;
      "--exitcode"|"-e")
        code="$2"

        local non_int=$(echo "$code" | grep -o -E "[a-z]*")

        if [ ! -z "$non_int" ]; then
          echo "argument --exitcode (-e) expects an integer"
          exit 1
        fi;

        shift
        shift
      ;;
      *)
        echo "command or option $1 is not supported"
        exit 1
      ;;
    esac
  done

  local exitcode=""
  if [ -z "$code" ]; then
    if [ -z "$key" ] || [ -z "$SHARK_PANIC_DICTIONARY" ]; then
      exitcode=1
    else
      exitcode=$(
        echo "$SHARK_PANIC_DICTIONARY" \
        | grep "^$key" \
        | grep -o -E "[0-9]+$"
      )
    fi;
  else
    exitcode="$code"
  fi;

  if [ -z "$message" ]; then
    if [ -z "$key" ] || [ ! -z "$code" ]; then
      printf "fatal error\n"
    else
      printf "fatal error: $key\n"
    fi;
  else
    printf "fatal error: $message"
  fi;

  exit "$exitcode"
}
