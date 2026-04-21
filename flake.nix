{
  description = "Personal CV";

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
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.typst ];
        };
      }
    );
}
