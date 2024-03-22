#!/bin/sh -l

#echo "$1" >> config.toml

cat "$1" >> config.toml

chmod 0600 config.toml

echo $(snow --config-file config.toml connection test) >> result.log

echo $(snow --config-file config.toml object stage copy $3 $2 --overwrite) >> result.log

echo "Hello World $0 $1 $2 $3 $4 $5"