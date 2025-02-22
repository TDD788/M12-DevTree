#!/bin/sh

DATA_PATH="/data/data"
TERMUX_PATH="$DATA_PATH/com.termux/files/usr"
TERMUX_BIN="$TERMUX_PATH/bin"
TERMUX_LIB="$TERMUX_PATH/lib"
TERMUX_CONFIG="$TERMUX_PATH/../home/.termux"

echo "Checking if /data/data is accessible..."
if [ ! -d "$DATA_PATH" ]; then
    echo "Error: /data/data is not accessible."
    exit 1
fi
echo "/data/data is accessible."

add_to_env() {
    var_name=$1
    path_to_add=$2
    eval current_path=\$$var_name
    if [ -z "$(echo $current_path | grep $path_to_add)" ]; then
        echo "Adding $path_to_add to $var_name"
        export "$var_name=$path_to_add:$current_path"
    fi
}

sync_binaries_libraries() {
    echo "Syncing binaries and libraries..."
    add_to_env "PATH" "$TERMUX_BIN"
    add_to_env "LD_LIBRARY_PATH" "$TERMUX_LIB"
}

sync_config_files() {
    if [ -f "$TERMUX_CONFIG" ]; then
        echo "Sourcing config file $TERMUX_CONFIG..."
        . "$TERMUX_CONFIG"
    else
        echo "Config file $TERMUX_CONFIG not found."
    fi
}

sync_binaries_libraries
sync_config_files

echo "Termux synchronized."
