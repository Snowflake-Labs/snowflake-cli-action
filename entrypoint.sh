#!/bin/sh -l

echo "$1" >> config.toml

chmod 0600 config.toml

echo $(snow --config-file config.toml connection test) >> result.log

echo $(snow --config-file config.toml object stage copy $3 $2 --overwrite) >> result.log

{
    echo 'LOG_SNOWCLI_STAGE_UPDATE<<EOF'
    echo &(cat result.log)
    echo EOF

} >> "$GITHUB_ENV"


