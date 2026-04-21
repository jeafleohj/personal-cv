{
  description = "Personal CV";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        cvPhone = builtins.getEnv "CV_PHONE";
        buildCv =
          name: lang:
          pkgs.stdenvNoCC.mkDerivation {
            pname = name;
            version = "1.0.0";
            src = builtins.path {
              path = ./.;
              name = "cv-source";
            };
            nativeBuildInputs = with pkgs; [ typst ];
            buildPhase = ''
              typst compile src/typst/cv.typ ${name}.pdf \
                --input lang=${lang} \
                --input phone=${pkgs.lib.escapeShellArg cvPhone}
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
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.typst ];
        };
      }
    );
}
