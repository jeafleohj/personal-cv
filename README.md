# personal-cv

CV in English and Spanish written in Typst. Nix provides the pinned
toolchain to generate the PDFs.

## Build
Generate both PDFs:

```sh
just build
```

The phone number is optional and read from `CV_PHONE`. When the variable is not
set, the contact line omits it.

Build and copy PDFs to `$HOME/Documents`:

```sh
just copy
```

Watch manual Typst exports under `dist/` while editing:

```sh
just typst-watch-es
just typst-watch-en
```

## Repository contents
- `flake.nix`, `flake.lock`: Nix toolchain and build definition.
- `src/typst/cv.typ`: main Typst entry point.
- `src/typst/layout.typ`: shared layout and rendering helpers.
- `src/typst/data.typ`: shared data wiring.
- `src/typst/data/*.typ`: CV content for experience, education, skills,
  languages, contributions, and interests.
- `result/*.pdf`: Nix build outputs.
- `dist/*.pdf`: optional manual Typst exports.
