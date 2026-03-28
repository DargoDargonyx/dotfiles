# Usage: backup [-r] <destination_dir> <file_or_dir>
backup() {
    local recursive=false
    if [ "$1" == "-r" ]; then
        recursive=true
        shift
    fi
    if [ $# -lt 2 ]; then
        echo "Usage: backup [-r] <destination_dir> <file_or_dir>"
        return 1
    fi
    local destDir="$1"
    local src="$2"
    if [ ! -e "${src}" ]; then
        echo "Source not found: ${src}"
        return 1
    fi

    mkdir -p "${destDir}"
    local timestamp
    timestamp=$(date +"%Y%m%d_%H%M%S")
    local base
    base=$(basename "${src}")
    local backupPath="${destDir}/${base}_${timestamp}"

    if [ "${recursive}" = true ]; then
        cp -r "${src}" "${backupPath}"
    else
        cp "${src}" "${backupPath}"
    fi

    if [ "${recursive}" = true ]; then
        rm -rf "${destDir}/${base}_latest"
        cp -r "${src}" "${destDir}/${base}_latest"
    else
        cp "${src}" "${destDir}/${base}_latest"
    fi

    echo "Backup created: ${backupPath}"
    echo "Latest copy updated: ${destDir}/${base}_latest"
}


# Usage: psg <program_name>
psg () {
    ps aux | grep -i "$1" | grep -v grep
}
