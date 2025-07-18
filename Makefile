# Personal Website Makefile
# Built with 11ty (Eleventy)

# Variables
NODE_MODULES = node_modules
SITE_DIR = _site
SRC_DIR = src
PORT = 8080

# Default target
.PHONY: help
help:
	@echo "Available commands:"
	@echo "  make install    - Install dependencies"
	@echo "  make serve      - Start development server"
	@echo "  make build      - Build for production"
	@echo "  make clean      - Clean build artifacts"
	@echo "  make watch      - Watch for changes and rebuild"
	@echo "  make dev        - Install deps and start dev server"

# Install dependencies
.PHONY: install
install:
	@echo "Installing dependencies..."
	npm install

# Start development server
.PHONY: serve
serve:
	@echo "Starting development server on http://localhost:$(PORT)..."
	npm start

# Build for production
.PHONY: build
build:
	@echo "Building for production..."
	npm run build

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(SITE_DIR)
	rm -rf .sass-cache

# Watch for changes and rebuild
.PHONY: watch
watch:
	@echo "Watching for changes..."
	npm start

# Development setup (install + serve)
.PHONY: dev
dev: install serve

# Check if dependencies are installed
.PHONY: check-deps
check-deps:
	@if [ ! -d "$(NODE_MODULES)" ]; then \
		echo "Dependencies not found. Run 'make install' first."; \
		exit 1; \
	fi

# Validate environment variables
.PHONY: check-env
check-env:
	@if [ ! -f ".env" ]; then \
		echo "Warning: .env file not found. Publications may not load correctly."; \
		echo "Create a .env file with AIRTABLE_PAT and AIRTABLE_BASE_ID variables."; \
	fi

# Full development setup with environment check
.PHONY: setup
setup: check-env install serve

# Quick start (assumes dependencies are already installed)
.PHONY: start
start: check-deps check-env serve