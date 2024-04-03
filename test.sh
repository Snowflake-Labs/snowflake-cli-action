#
current_path=$(which snow)
previous_path=$(which snow)
if [[ "$current_path" = "$previous_path" ]]
then
    echo "Using snow installed in $current_path, should be $previous_path"
    exit 1
fi
