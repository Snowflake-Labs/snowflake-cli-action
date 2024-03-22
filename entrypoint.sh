#!/bin/sh -l

#echo "$1" >> config.toml

value=`cat Testconfig.toml`  

echo "$value"  

chmod 0600 $1

echo $(snow --config-file $1 connection test) >> result.log

echo $(snow --config-file $1 object stage copy $3 $2 --overwrite) >> result.log

echo "Hello World $0 $1 $2 $3 $4 $5 USER: $USER"


