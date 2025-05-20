{
  description = "Home Manager configuration of evest";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    ags.url = "github:aylur/ags";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixvim, home-manager, stylix, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    in
    {
      homeConfigurations."evest@nixos" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          stylix.homeModules.stylix
          ./home.nix
          nixvim.homeManagerModules.nixvim
        ];

        extraSpecialArgs = { inherit inputs; };
      };
    };
}
