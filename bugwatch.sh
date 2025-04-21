#!/bin/bash

FILE="$HOME/.bugwatchlist"

RED=$(tput setaf 1)
YELLOW=$(tput setaf 3)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
RESET=$(tput sgr0)

add_note() {
    TAG=$1
    shift
    NOTE="$*"
    echo "$TAG|$NOTE" >> "$FILE"
    echo -e "✅ Added: [$TAG] $NOTE"
}

list_notes() {
    echo
    echo "${RED}${BOLD}🔴 HIGH${RESET}"
    grep '^HIGH|' "$FILE" | nl -w2 -s'. ' | sed "s/HIGH|//"

    echo
    echo "${YELLOW}${BOLD}🟡 MEDIUM${RESET}"
    grep '^MEDIUM|' "$FILE" | nl -w2 -s'. ' | sed "s/MEDIUM|//"

    echo
    echo "${WHITE}${BOLD}⚪ LOW${RESET}"
    grep '^LOW|' "$FILE" | nl -w2 -s'. ' | sed "s/LOW|//"
    echo
}

case "$1" in
    add)
        shift
        TAG=""
        case "$1" in
            --tag)
                shift
                TAG=$(echo "$1" | tr a-z A-Z)
                shift
                ;;
        esac
        add_note "$TAG" "$*"
        ;;
    list)
        list_notes
        ;;
    *)
        echo "Usage: $0 {add --tag [high|medium|low] \"your note\" | list}"
        ;;
esac
