#!/usr/bin/env bash

# Firefox Cupertino Theme Installation Script

set -e

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CHROME_DIR="${SCRIPT_DIR}/chrome"

# Firefox profile directories
FIREFOX_DIRS=(
    "${HOME}/.mozilla/firefox"
    "${HOME}/.config/mozilla/firefox"
    "${HOME}/.var/app/org.mozilla.firefox/.mozilla/firefox"
    "${HOME}/snap/firefox/common/.mozilla/firefox"
)

# Function to install the theme in a profile
install_theme() {
    local profile_path="$1"
    local variant="$2"
    
    echo "Installing theme to profile: ${profile_path}"
    
    mkdir -p "${profile_path}/chrome"
    
    # Copy Cupertino folder
    cp -r "${CHROME_DIR}/Cupertino" "${profile_path}/chrome/"
    cp "${CHROME_DIR}/customChrome.css" "${profile_path}/chrome/"
    
    # Select variant files
    local uc_file="userChrome.css"
    local ut_file="userContent.css"
    
    if [ "${variant}" == "adaptive" ]; then
        uc_file="userChrome-adaptive.css"
        ut_file="userContent-adaptive.css"
    elif [ "${variant}" == "darker" ]; then
        uc_file="userChrome-darker.css"
        ut_file="userContent-darker.css"
    elif [ "${variant}" == "nord" ]; then
        uc_file="userChrome-nord.css"
        ut_file="userContent-nord.css"
    fi
    
    cp "${CHROME_DIR}/${uc_file}" "${profile_path}/chrome/userChrome.css"
    cp "${CHROME_DIR}/${ut_file}" "${profile_path}/chrome/userContent.css"
    
    # Enable legacy user profile customizations
    local prefs_file="${profile_path}/prefs.js"
    if [ -f "${prefs_file}" ]; then
        if grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "${prefs_file}"; then
            sed -i 's/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", false);/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);/' "${prefs_file}"
        else
            echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "${prefs_file}"
        fi
    fi
}

# Function to uninstall the theme from a profile
uninstall_theme() {
    local profile_path="$1"
    
    echo "Uninstalling theme from profile: ${profile_path}"
    
    # Remove theme files
    rm -rf "${profile_path}/chrome/Cupertino"
    rm -f "${profile_path}/chrome/customChrome.css"
    rm -f "${profile_path}/chrome/userChrome.css"
    rm -f "${profile_path}/chrome/userContent.css"
    
    # Optionally remove empty chrome folder
    if [ -d "${profile_path}/chrome" ] && [ -z "$(ls -A "${profile_path}/chrome" 2>/dev/null)" ]; then
        rmdir "${profile_path}/chrome"
    fi
    
    # Disable legacy user profile customizations in prefs.js
    local prefs_file="${profile_path}/prefs.js"
    if [ -f "${prefs_file}" ]; then
        if grep -q "toolkit.legacyUserProfileCustomizations.stylesheets" "${prefs_file}"; then
            sed -i 's/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);/user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", false);/' "${prefs_file}"
        fi
    fi
}

# Function to show usage help
show_help() {
    echo "Firefox Cupertino Theme Installation Script"
    echo ""
    echo "Usage: ./tweaks.sh [options]"
    echo ""
    echo "Options:"
    echo "  -f, --full [variant]   Install the theme to all Firefox profiles."
    echo "                         Variants: default, adaptive, darker, nord (default is 'default')."
    echo "  -e, --edit             Open the first profile's chrome folder in the file manager."
    echo "  -u, --uninstall        Uninstall the theme from all Firefox profiles."
    echo "  -h, --help             Show this help message."
}

# Parse arguments
VARIANT="default"
COMMAND=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -f|--full)
            COMMAND="install"
            shift
            if [[ $# -gt 0 && ! "$1" =~ ^- ]]; then
                VARIANT="$1"
                shift
            fi
            ;;
        -e|--edit)
            COMMAND="edit"
            shift
            ;;
        -u|--uninstall)
            COMMAND="uninstall"
            shift
            ;;
        -h|--help)
            COMMAND="help"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            echo "Use -h or --help for usage details."
            exit 1
            ;;
    esac
done

if [ -z "${COMMAND}" ] || [ "${COMMAND}" == "help" ]; then
    show_help
    exit 0
fi

if [ "${COMMAND}" == "install" ]; then
    FOUND_PROFILES=0
    for firefox_dir in "${FIREFOX_DIRS[@]}"; do
        if [ -d "${firefox_dir}" ]; then
            profiles=$(find "${firefox_dir}" -maxdepth 1 -type d -name "*.default*" -o -name "*.default-release*")
            for profile in ${profiles}; do
                install_theme "${profile}" "${VARIANT}"
                FOUND_PROFILES=1
            done
        fi
    done
    
    if [ "${FOUND_PROFILES}" -eq 0 ]; then
        echo "No Firefox profiles found."
        exit 1
    fi
    
    echo "Done! Please restart Firefox for changes to take effect."
elif [ "${COMMAND}" == "uninstall" ]; then
    FOUND_PROFILES=0
    for firefox_dir in "${FIREFOX_DIRS[@]}"; do
        if [ -d "${firefox_dir}" ]; then
            profiles=$(find "${firefox_dir}" -maxdepth 1 -type d -name "*.default*" -o -name "*.default-release*")
            for profile in ${profiles}; do
                uninstall_theme "${profile}"
                FOUND_PROFILES=1
            done
        fi
    done
    
    if [ "${FOUND_PROFILES}" -eq 0 ]; then
        echo "No Firefox profiles found."
        exit 1
    fi
    
    echo "Done! Theme successfully uninstalled. Please restart Firefox."
elif [ "${COMMAND}" == "edit" ]; then
    # Just open the first profile directory in the file manager
    for firefox_dir in "${FIREFOX_DIRS[@]}"; do
        if [ -d "${firefox_dir}" ]; then
            profile=$(find "${firefox_dir}" -maxdepth 1 -type d -name "*.default*" -o -name "*.default-release*" | head -n 1)
            if [ -n "${profile}" ]; then
                xdg-open "${profile}/chrome" || echo "Please open ${profile}/chrome manually."
                exit 0
            fi
        fi
    done
    echo "No Firefox profiles found."
fi

