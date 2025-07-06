#!/usr/bin/env bash

# python will have all of them solved
PROBLEMS_DIR="python"
LANGS=("python" "cpp" "rust")

run_solution() {
    lang="$1"
    pbname="$2"

    case "$lang" in
        python)
            cd python || exit 1
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

test_solution() {
    lang="$1"
    pbname="$2"

    case "$lang" in
        python)
            cd python || exit 1

            files=(../tests/"$pbname"/*.in)
            if [ ${#files[@]} -eq 0 ]; then
                echo "❗ No test files found for problem $pbname"
                exit 1
            fi

            for test_case in "${files[@]}"; do
                base_name=$(basename "$test_case" .in)
                echo "Running test: $base_name"

                expected="../tests/$pbname/${base_name}.out"
                actual_output=$(uv run "$pbname.py" < "$test_case")
                expected_output=$(<"$expected")

                if [ "$actual_output" == "$expected_output" ]; then
                    echo "✅ Passed"
                else
                    echo "❌ Failed"
                    echo "Expected:"
                    echo "$expected_output"
                    echo "Got:"
                    echo "$actual_output"
                fi
                echo
            done
            cd ..
            ;;
        cpp)
            files=(tests/"$pbname"/*.in)
            if [ ${#files[@]} -eq 0 ]; then
                echo "❗ No test files found for problem $pbname"
                exit 1
            fi

            for test_case in "${files[@]}"; do
                base_name=$(basename "$test_case" .in)
                echo "Running test: $base_name"

                expected="tests/$pbname/${base_name}.out"
                actual_output=$(make -s -C cpp "$pbname" < "$test_case")
                expected_output=$(<"$expected")

                if [ "$actual_output" == "$expected_output" ]; then
                    echo "✅ Passed"
                else
                    echo "❌ Failed"
                    echo "Expected:"
                    echo "$expected_output"
                    echo "Got:"
                    echo "$actual_output"
                fi
                echo
            done
            ;;
        rust)
            files=(tests/"$pbname"/*.in)
            if [ ${#files[@]} -eq 0 ]; then
                echo "❗ No test files found for problem $pbname"
                exit 1
            fi

            for test_case in "${files[@]}"; do
                base_name=$(basename "$test_case" .in)
                echo "Running test: $base_name"

                expected="tests/$pbname/${base_name}.out"
                actual_output=$(cargo run --manifest-path rust/Cargo.toml --bin "$pbname" -q < "$test_case")
                expected_output=$(<"$expected")

                if [ "$actual_output" == "$expected_output" ]; then
                    echo "✅ Passed"
                else
                    echo "❌ Failed"
                    echo "Expected:"
                    echo "$expected_output"
                    echo "Got:"
                    echo "$actual_output"
                fi
                echo
            done
            ;;
        *)
            echo "Unsupported language: $lang"
            exit 1
            ;;
    esac
}

list_problems() {
    action="$1"

    # Use fzf for interactive selection
    selected_problem="$(find "$PROBLEMS_DIR" -maxdepth 1 -mindepth 1 -type f -regex ".+\.py" | while read -r fp; do
        problem_name=$(basename "$fp" ".py")
        echo "$problem_name"
    done | fzf --height 40% --border --prompt="Select problem: ")"

    if [[ -z "$selected_problem" ]]; then
        echo "Nothing selected"
        exit 1
    fi

    # Language selection
    selected_lang="$(printf "%s\n" "${LANGS[@]}" | fzf --height 40% --border --prompt="Select language: ")"

    if [[ -z "$selected_lang" ]]; then
        echo "No language selected"
        exit 1
    fi

    if [[ "$action" == "run" ]]; then
        echo "Executing ${selected_problem} in ${selected_lang}"
        run_solution "$selected_lang" "$selected_problem"
    elif [[ "$action" == "test" ]]; then
        echo "Testing ${selected_problem} in ${selected_lang}"
        test_solution "$selected_lang" "$selected_problem"
    fi

}

clean_rust() {
    echo "cleaning rust target dir"
    cargo clean --manifest-path rust/Cargo.toml
}

clean_cpp() {
    echo "cleaning C++ bin dir"
    make clean -C cpp
}

if [[ "$#" -eq 0 ]]; then
    list_problems "run"
elif [[ "$#" -eq 1 ]]; then
    if [[ "$1" == "clean" ]]; then
        clean_rust
        clean_cpp
    elif [[ "$1" == "test" ]]; then
        list_problems "test"
    fi
else
    echo "Usage: ./run.sh"
    exit 1
fi
