# Usage: backup [-r] <destination_dir> <file_or_dir>
backup() {
    local recursive=false
    if [ "${1}" == "-r" ]; then
        recursive=true
        shift
    fi
    if [ $# -lt 2 ]; then
        echo "Usage: backup [-r] <destination_dir> <file_or_dir>"
        return 1
    fi
    local destDir="${1}"
    local src="${2}"
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
    ps aux | grep -i "${1}" | grep -v grep
}

# Usage: clearTmp [-options]
clrTmp() {
	if [ -n "${1}" ]; then
		if [ "${1}" == "-d" ]; then
			rm -rf "${HOME}/Downloads/"*
			echo "Cleared Downloads directory"
		else
			if [ "${1}" == "-s" ]; then
				rm -rf "${HOME}/Media/Screenshots/"*
				echo "Cleared Screenshots directory"
			else
				echo "ERROR: Unknown option provided"
			fi
		fi
	else
		rm -rf "${HOME}/Downloads/"*
		echo "Cleared Downloads directory"
		rm -rf "$HOME/Media/Screenshots/"*
		echo "Cleared Screenshots directory"
	fi
}


# Usage: countLines <file_extension> <directory> [--exclude dir1,dir2,...]
countLines() {
    local ext="${1#.}"
    local dir="${2%/}"
    shift 2
    local excludes=()
    while [[ $# -gt 0 ]]; do
        case ${1} in
            --exclude)
                IFS=',' read -ra excludes <<< "${2}"
                shift 2
                ;;
            *)
                echo "Unknown option: ${1}"
                return 1
                ;;
        esac
    done

    local findArgs=("${dir}")
    for ex in "${excludes[@]}"; do
        findArgs+=(-path "${dir}/${ex}" -prune -o)
    done
    findArgs+=(-name "*.${ext}" -print)

	find "${findArgs[@]}" | xargs wc -l | while IFS= read -r line; do
		trimmed="${line#"${line%%[! ]*}"}"  # strip leading spaces
		num="${trimmed%% *}"
		rest="${trimmed#* }"
		if [[ ${trimmed} =~ total$ ]]; then
			echo -e "\033[1;36m${num}\033[0m \033[38;5;135mtotal\033[0m"
		else
			echo -e "\033[1;36m${num}\033[0m ${rest}"
		fi
	done
}
