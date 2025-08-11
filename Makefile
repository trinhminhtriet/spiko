NAME    := spiko
AUTHOR  := trinhminhtriet
DATE    := $(shell date +%FT%T%Z)
GIT     := $(shell [ -d .git ] && git rev-parse --short HEAD)
VERSION := $(shell git describe --tags)

default: build

clean:
	@echo "Cleaning build dir"
	@$(RM) -r target
	@echo "Cleaning using cargo"
	@cargo clean

check:
	@echo "Checking $(NAME)"
	@cargo check

test:
	@echo "Running tests"
	@cargo test
	@echo "Running tests with coverage and open report in browser"
	@cargo tarpaulin --out Html --open

build:
	@echo "Building release: $(VERSION)"
	@cargo build --release
	ln -sf $(PWD)/target/release/$(NAME) $(HOME)/.local/bin/$(NAME)
	which $(NAME)
	$(NAME) --version

build_debug:
	@echo "Building debug"
	@cargo build

run:
	@echo "Running debug"
	@cargo run

release:
	./scripts/release-version.sh
