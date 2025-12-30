# personal-cv

CV in English and Spanish written in LaTeX (LuaLaTeX). Nix provides the toolchain to generate the PDFs.

## Build
Generate both PDFs:

```sh
nix build
```

Generate a single PDF:

```sh
nix build .#cv-en-pdf
nix build .#cv-es-pdf
```

## Repository contents
- `flake.nix`, `flake.lock`: Nix toolchain and build definition.
- `src/cv.tex`: main LaTeX entrypoint.
- `src/preamble.tex`: shared LaTeX settings.
- `src/lua/`: data and rendering helpers.
- `.luarc.json`: Lua tooling config.
