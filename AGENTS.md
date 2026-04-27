# Repository Guidelines

## Project Structure & Module Organization
This repository builds a CV with Typst and Nix.
Key paths:
- `src/typst/cv.typ`: Typst entry point.
- `src/typst/layout.typ`: shared Typst layout and rendering helpers.
- `src/typst/data.typ`: shared data wiring.
- `src/typst/data/*.typ`: content for experience, education, skills,
  languages, contributions, and interests.
- `result/*.pdf`: Nix build outputs.
- `dist/*.pdf`: optional manual Typst exports.

## Build, Test, and Development Commands
- `nix build .#cv-en-pdf` / `nix build .#cv-es-pdf`: build a single PDF.
- `nix build .#default`: build both PDFs under `result/`.
- `nix develop`: enter a shell with the pinned Typst toolchain.
- `just build`: run the default Nix build.
- `just typst-watch-es` / `just typst-watch-en`: watch a manual PDF build
  under `dist/`.
- `just copy`: build and copy `result/*` PDFs to `$HOME/Documents`.
- `just clean`: remove generated PDF artifacts (`result/` and `dist/`).

## Coding Style & Naming Conventions
- Typst data: keep English and Spanish content aligned and concise.
- Keep bullets one line where possible; prefer action + outcome language.
- Use Title Case for section titles; avoid duplicate logic across files.
- Keep PDF output names consistent (`jhonyangulof-en.pdf`/`-es.pdf`).

## Testing Guidelines
There is no automated test suite. Before sharing changes:
- Build PDFs with `nix build .#default`.
- For iterative layout checks, run `just typst-watch-es` or
  `just typst-watch-en` and inspect `dist/*.pdf`.
- Open `result/*.pdf` and `dist/*.pdf` when relevant, and verify layout,
  accents, and links.

## Commit & Pull Request Guidelines
Recent commits use short, imperative subjects and often follow
Conventional Commits (e.g., `feat:` / `chore:`). Keep subjects concise
and mention notable changes or build commands in the body if needed.

## Security & Configuration Tips
Builds must work with packages pinned in `flake.nix`. Avoid remote assets
or fonts not available in the Nix Typst toolchain, and do not publish
sensitive personal data.
