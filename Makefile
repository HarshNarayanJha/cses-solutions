PROBLEMS_DIR := problems

PROBLEM_NAME :=

PDIR := $(PROBLEMS_DIR)/$(PROBLEM_NAME)

.PHONY: all clean python cpp rust

all:
	@echo "Use ./run.sh to select and execute problems."

clean:
	@echo "Cleaning build artifacts in $(PDIR)..."
	rm -f "$(PDIR)/bin/main_c"
	rm -f "$(PDIR)/bin/main_rs"
	-rmdir "$(PDIR)/bin"
	@echo "Cleaned."

python:
	@echo "Running Python solution in $(PDIR)/main.py..."
	cd "$(PDIR)" && uv run main.py

cpp:
	@echo "Building and running C++ solution in $(PDIR)/main.cpp..."
	-mkdir "$(PDIR)/bin"
	clang++ -o "$(PDIR)/bin/main_c" "$(PDIR)/main.cpp"
	"$(PDIR)/bin/main_c"

rust:
	@echo "Building and running Rust solution in $(PDIR)/main.rs..."
	-mkdir "$(PDIR)/bin"
	rustc -o "$(PDIR)/bin/main_rs" "$(PDIR)/main.rs"
	"$(PDIR)/bin/main_rs"
