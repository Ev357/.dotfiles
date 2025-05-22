{
  description = "A basic flake with a shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    ags.url = "github:aylur/ags";
  };
  outputs =
    { nixpkgs, flake-utils, ags, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            bun
            (ags.packages.${system}.default.override {
              extraPackages = [
                ags.packages.${system}.battery
              ];
            })
          ];
        };
      }
    );
}
