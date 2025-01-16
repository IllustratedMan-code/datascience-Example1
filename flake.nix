{
  description = "My Flake";
  inputs = { flake-utils.url = "github:numtide/flake-utils"; };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.system;
      in {
        packages = rec { };
        devShells = rec {
          default = pkgs.mkShell {
            packages = with pkgs; [
              pkgs.rWrapper.override
              { packages = with pkgs.rPackages; [ ggplot ]; }

            ];
          };
        };
      });
}
