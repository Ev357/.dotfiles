{
  description = "Home Manager configuration of evest";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix/release-24.11";
  };

  outputs = { nixpkgs, home-manager, nixvim, stylix, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."evest" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          stylix.homeManagerModules.stylix
          ./home.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
