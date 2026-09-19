#!/usr/bin/env bash

show_pkg_info() {
    info="$1"
    ORANGE='\033[38;5;208m'
    DARK_GRAY='\033[90m'
    RESET='\033[0m'
    while read -r line; do
        case "$line" in
            Name*)
                name="${line#*: }"
                ;;

            Version*)
                version="${line#*: }"
                ;;

            "Installed Size"*)
                size="${line#*: }"
                printf '%b%-30s%b %b%-20s%b %b%-20s%b\n' \
                                "$ORANGE" "$name" "$RESET" \
                                "$DARK_GRAY" "$version" "$RESET" \
                                "$DARK_GRAY" "$size" "$RESET"
        esac
    done <<< "$info"
}