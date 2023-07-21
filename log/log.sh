#!/bin/bash
function fine() {
  local message="$1"
  _do_log "3" "Fine" "$message"
}

function info() {
  local message="$1"
  _do_log "2" "Info" "$message"
}

function warn() {
  local message="$1"
  _do_log "1" "Warn" "$message"
}

function error() {
  local message="$1"
  _do_log "0" "Fail" "$message"
}

function _do_log() {
  local compared_vrb="$1"
  local level="$2"
  local message="$3"

  local vrb=3
  if [ ! -z "$SHARK_LOG_VERBOSITY" ]; then
    vrb=4
  fi;

  if [ "$vrb" -gt "$compared_vrb" ]; then
    local msg="$level: $message\n"

    if [ ! -z "$SHARK_LOG_WITH_MACHINE_NAME" ]; then
      msg="<$(uname -n)> $msg"
    fi;

    if [ ! -z "$SHARK_LOG_WITH_SCRIPT_NAME" ]; then
      msg="($(basename "$0")) $msg"
    fi;

    if [ ! -z "$SHARK_LOG_WITH_TIMESTAMP" ]; then
      msg="[$(date)] $msg"
    fi;

    if [ -z "$SHARK_LOG_NO_STDOUT" ]; then
      printf "$msg"
    fi;

    if [ ! -z "$SHARK_LOG_FILE" ]; then
      if [ ! -e "$SHARK_LOG_FILE" ]; then
        touch "$SHARK_LOG_FILE"
      fi;
      printf "$msg" >> "$SHARK_LOG_FILE" 
    fi;
  fi;
}

