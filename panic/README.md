# Overview

Terminate program execution with an exitcode and an optional message.

# Usage

API:
  - `panic` - exits program and prints a message. Arguments:

    * `--exitcode` (`-e`) - explicitly specified exitcode (must be an integer)
    * `--key` (`-k`)      - a reference to the contents of `SHARK_PANIC_DICTIONARY`
    * `--message` (`-m`)  - customised error message
  
Usage:

```shell
source ./log.sh

# exits with code 100 and message 'oops'
panic --exitcode 100 --message 'oops'


export SHARK_PANIC_DICTIONARY="
generic-error:4
"

# exits with code 4 and message 'fatal error: generic-error' 
panic --key 'generic-error'
```

# Configuration
  
Configuration:

- SHARK_PANIC_DICTIONARY - a simple string that contains lines in the form of `key:int-error-code-value`; `key` is referenced by `--key` argument. 
