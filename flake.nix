{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    luacats-tex-luatex = {
      url = "github:LuaCATS/tex-luatex";
      flake = false;
    };
    altacv = {
      type = "github";
      owner = "liantze";
      repo = "AltaCV";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      altacv,
      luacats-tex-luatex,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        cvPhone = builtins.getEnv "CV_PHONE";
        tex = pkgs.texlive.combined.scheme-full;
        buildCv =
          name: lang:
          pkgs.stdenvNoCC.mkDerivation {
            pname = name;
            version = "1.0.0";
            src = builtins.path {
              path = ./.;
              name = "cv-source";
            };
            nativeBuildInputs = [ tex ];
            buildPhase = ''
              export HOME="$TMPDIR"
              export TEXMFVAR="$TMPDIR/texmf-var"
              export TEXINPUTS="${altacv}//:$TEXINPUTS"
              export SOURCE_DATE_EPOCH=1
              export TZ=UTC
              export CV_PHONE=${pkgs.lib.escapeShellArg cvPhone}
              lualatex -interaction=nonstopmode -halt-on-error -file-line-error \
                -jobname=${name} "\\def\\cvlang{${lang}}\\input{src/cv.tex}"
            '';
            installPhase = ''
              mkdir -p $out
              cp ${name}.pdf $out/
            '';
          };
        cvEn = buildCv "jhonyangulof-en" "en";
        cvEs = buildCv "jhonyangulof-es" "es";
      in
      {
        packages = {
          cv-en-pdf = cvEn;
          cv-es-pdf = cvEs;
          default = pkgs.symlinkJoin {
            name = "cv-pdfs";
            paths = [
              cvEn
              cvEs
            ];
          };
        };
        apps = {
          export-cv-en = flake-utils.lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "export-cv-en";
              runtimeInputs = [ pkgs.nix ];
              text = ''
                set -euo pipefail
                out_path="$(nix build --impure --no-link --print-out-paths "${self}#cv-en-pdf")"
                mkdir -p dist
                cp -f "$out_path"/jhonyangulof-en.pdf dist/jhonyangulof-en.pdf
                echo "Wrote dist/jhonyangulof-en.pdf"
              '';
            };
          };
          export-cv-es = flake-utils.lib.mkApp {
            drv = pkgs.writeShellApplication {
              name = "export-cv-es";
              runtimeInputs = [ pkgs.nix ];
              text = ''
                set -euo pipefail
                out_path="$(nix build --impure --no-link --print-out-paths "${self}#cv-es-pdf")"
                mkdir -p dist
                cp -f "$out_path"/jhonyangulof-es.pdf dist/jhonyangulof-es.pdf
                echo "Wrote dist/jhonyangulof-es.pdf"
              '';
            };
          };
        };
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.emacs
            tex
          ];
          shellHook = ''
            mkdir -p .luacats
            ln -sfn ${luacats-tex-luatex} .luacats/tex-luatex
          '';
        };
      }
    );
}
