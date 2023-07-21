# Overview

Simplistic shell logging facility.

# Usage

API:
  - `error` - prints log message with level `Fail`
  - `warn` - prints log message with level `Warn`
  - `info` - prints log message with level `Info`
  - `fine` - prints log message with level `Fine`
  
Usage:

```shell
source ./log.sh

info "message"
```

# Configuration
  
Configuration:

- SHARK_LOG_VERBOSITY - enables `Fine` log level
- SHARK_LOG_NO_STDOUT - disables output to stdout
- SHARK_LOG_FILE - prints logs to a specified file (creates a file unless it exists)
- SHARK_LOG_WITH_TIMESTAMP - adds timestamp using `$(date)` to the log entry
- SHARK_LOG_WITH_SCRIPT_NAME - adds script name to the log entry
- SHARK_LOG_WITH_MACHINE_NAME - adds machine name using `$(uname -n)` to the log entry

With all `_WITH_` variables set, logs will have the format like below:
```text
[%date%] (%script-name%s) <%machine-name%> %level%: %message%
```
