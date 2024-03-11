{
  description = "template for math proofs";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/23.11";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    let
      system = flake-utils.lib.system.x86_64-linux;
      pkgs = import nixpkgs { inherit system; };
      cleaner = pkgs.writeShellApplication {
        name = "cleaner";
        text = ''
          rm -rf -- *.aux *.fdb_latexmk *.fls *.log *.out *.pdf *.synctex.gz *.toc
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
        cleaner = {
          type = "app";
          program = "${cleaner}/bin/cleaner";
        };
      };
    };
}
