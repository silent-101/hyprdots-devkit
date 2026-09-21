#!/bin/bash

CORE_PKG_FILE="./core_pkg.txt"
CURRENT_DIR="$(pwd)"
ROOT_DIR="$(dirname "$CURRENT_DIR")"
HELPER_SCRIPTS_DIR="$CURRENT_DIR/helpers"
CONFIG_DIR="$ROOT_DIR/conf/.config"
source "$HELPER_SCRIPTS_DIR/utils.sh"
source "$HELPER_SCRIPTS_DIR/showpkginfo.sh"

pkgs=()

check_yay() {
    info "Checking if yay is installed..."
    if ! command -v yay >/dev/null 2>&1; then
        error "yay is not installed."
        return 1
    fi
    success "yay is installed."
}

read_packages() {
    while read -r pkg; do
        if [[ -z "$pkg" ]] || [[ "$pkg" == \#* ]]; then
            continue
        fi
        pkgs+=("$pkg")
    done < "$CORE_PKG_FILE"
}

get_package_info() {
    yay -Si "${pkgs[@]}"
}


confirm() {
    printf '%b[INFO]%b %s ' "$BLUE" "$RESET" "$1 [Y/n]:"
    read -r answer
    [[ -z "$answer" || "$answer" =~ ^[Yy]$ ]]
}

install_packages() {
    info "Installing packages..."
    yay -S --needed "${pkgs[@]}"
}

copy_config_files() {
    info "Copying configuration files..."
    cp -a "$CONFIG_DIR"/. "$HOME/.config/"
    success "Configuration files copied."
}

reboot_prompt() {
    if confirm "Do you want to reboot now?"; then
        info "Rebooting..."
        sudo reboot        
    else
        info "Reboot skipped. Please remember to reboot later."
    fi
}


main() {
    if ! check_yay; then
        exit 1
    fi
    read_packages
    info "Fetching package information..."
    show_pkg_info "$(get_package_info)"
    confirm "Continue with installation?" || { error "Installation aborted."; exit 0; }
    install_packages
    copy_config_files
    reboot_prompt
    success "Installation completed successfully."
}

main
