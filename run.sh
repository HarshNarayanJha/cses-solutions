#!/usr/bin/env bash

# python will have all of them solved
PROBLEMS_DIR="python"
LANGS=("python" "cpp" "rust")

run_solution() {
    lang="$1"
    pbname="$2"

    case "$lang" in
        python)
            cd python
            uv run "$pbname.py"
            cd ..
            ;;
        cpp)
            make -s -C cpp "$pbname"
            ;;
        rust)
            cargo run --manifest-path rust/Cargo.toml --bin "$pbname"
            ;;
        *)
            echo "Unsupported language: $lang"
            exit 1
            ;;
    esac
}

list_problems() {
    # Use fzf for interactive selection
    selected_problem="$(find "$PROBLEMS_DIR" -maxdepth 1 -mindepth 1 -type f -regex ".+\.py" | while read -r fp; do
        problem_name=$(basename "$fp" ".py")
        echo "$problem_name"
    done | fzf --height 40% --border --prompt="Select problem: ")"

    if [ -z "$selected_problem" ]; then
        echo "Nothing selected"
        exit 1
    fi

    # Language selection
    selected_lang="$(printf "%s\n" "${LANGS[@]}" | fzf --height 40% --border --prompt="Select language: ")"

    if [ -z "$selected_lang" ]; then
        echo "No language selected"
        exit 1
    fi

    echo "Executing ${selected_problem} in ${selected_lang}"
    run_solution "$selected_lang" "$selected_problem"
}

clean_rust() {
    echo "cleaning rust target dir"
    cargo clean --manifest-path rust/Cargo.toml
}

clean_cpp() {
    echo "cleaning C++ bin dir"
    make clean -C cpp
}

if [ "$#" -eq 0 ]; then
    list_problems
elif [ "$#" -eq 1 ]; then
    if [ "$1" == "clean" ]; then
        clean_rust
        clean_cpp
    fi
else
    echo "Usage: ./run.sh"
    exit 1
fi
