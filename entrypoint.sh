#!/bin/sh

mkdir -p ./temp_config_file
cp "$1" ./temp_config_file/config.toml
chmod 0600 ./temp_config_file/config.toml
echo $(snow --config-file ./temp_config_file/config.toml connection test)

current_dir=$(pwd)
git config --global --add safe.directory $current_dir

cd $2
snow --config-file ${current_dir}/temp_config_file/config.toml app version create 
snow  --config-file ${current_dir}/temp_config_file/config.toml app run
rm -r ${current_dir}/temp_config_file
