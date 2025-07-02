#!/usr/bin/env bash

PROBLEMS_DIR="problems"

list_problems() {
    # Use fzf for interactive selection
    selected_problem="$(find "$PROBLEMS_DIR" -maxdepth 1 -mindepth 1 -type d | while read -r dir; do
        problem_name=$(basename "$dir")
        echo "$problem_name"
    done | fzf --height 40% --border --prompt="Select problem: ")"

    if [ -z "$selected_problem" ]; then
        echo "Nothing selected"
        exit 1
    fi

    # Language selection
    LANGS=("python" "cpp" "rust")
    selected_lang="$(printf "%s\n" "${LANGS[@]}" | fzf --height 40% --border --prompt="Select language: ")"

    if [ -z "$selected_lang" ]; then
        echo "No language selected"
        exit 1
    fi

    echo "Executing ${selected_problem} in ${selected_lang}"
    make "$selected_lang" "PROBLEM_NAME=$selected_problem"
}

if [ "$#" -eq 0 ]; then
    list_problems
elif [ "$#" -eq 1 ]; then
    if [ "$1" == "clean" ]; then
         find "$PROBLEMS_DIR" -maxdepth 2 -mindepth 2 -type d -name 'bin' | while read -r dir; do
             pname=$(basename $(echo "$dir" | cut -d'/' -f-2))
             make clean "PROBLEM_NAME=$pname"
         done
    fi
else
    echo "Usage: ./run.sh"
    exit 1
fi
