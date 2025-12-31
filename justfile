# Default recipe
default: copy

# Build with Nix
build:
    nix build --impure

# Copy PDFs to Documents
copy: build
    #!/bin/bash
    pdf_dir="$HOME/Documents"
    mkdir -p "$pdf_dir"
    cp -f result/* "$pdf_dir"
    echo "✓ PDFs copied to $pdf_dir"

# Clean build artifacts
clean:
    rm -rf result
    @echo "✓ Build artifacts cleaned"

# Help
help:
    @just --list
