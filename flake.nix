{
  description = "template for math proofs";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/23.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    let
      system = flake-utils.lib.system.x86_64-linux;
      pkgs = import nixpkgs { inherit system; };
      cleaner = pkgs.writeShellApplication {
        name = "clean";
        text = "latexmk -C -auxdir=aux -outdir=pdf";
      };
      makepdf = pkgs.writeShellApplication {
        name = "makepdf";
        text = ''
          mkdir -p aux pdf
          latexmk -interaction=nonstopmode -lualatex -pdf -auxdir=aux -outdir=pdf ./*tex
        '';
      };
    in {
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            python311Packages.pygments
            texlive.combined.scheme-basic
          ];
        };
      };
      apps.${system} = {
        clean = {
          type = "app";
          program = "${cleaner}/bin/clean";
        };
        makepdf = {
          type = "app";
          program = "${makepdf}/bin/makepdf";
        };
      };
    };
}
