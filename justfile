# Default recipe
default: copy

# Build both PDFs with Nix into the result/ symlink
build:
    nix build --impure

# Shared watch helper. Kept private because just-lsp cannot provide arguments.
[private]
typst-watch lang:
    mkdir -p dist
    typst watch src/typst/cv.typ dist/jhonyangulof-{{ lang }}.pdf \
      --input lang={{ lang }} \
      --input phone="$CV_PHONE"

# Watch the English manual PDF under dist/
typst-watch-en: (typst-watch "en")

# Watch the Spanish manual PDF under dist/
typst-watch-es: (typst-watch "es")

# Build with Nix and copy generated PDFs to Documents
copy: build
    #!/bin/bash
    pdf_dir="$HOME/Documents"
    mkdir -p "$pdf_dir"
    cp -f result/* "$pdf_dir"
    echo "✓ PDFs copied to $pdf_dir"

# Remove generated PDF artifacts
clean:
    rm -rf result dist
    @echo "✓ Build artifacts cleaned"

# Help
help:
    @just --list
