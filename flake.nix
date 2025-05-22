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

  outputs = { nixpkgs, home-manager, ... }@inputs:
    {
      homeConfigurations = {
        "evest@nixos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";

          modules = [
            ./hosts/nixos/home.nix
            {
              home = {
                username = "evest";
                homeDirectory = "/home/evest";
                stateVersion = "24.11";
              };
            }
          ];

          extraSpecialArgs = { inherit inputs; };
        };

        "evest@lucas.gager" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";

          modules = [
            ./hosts/archlinux/home.nix
            {
              home = {
                username = "evest";
                homeDirectory = "/home/evest";
                stateVersion = "24.11";
              };
            }
          ];

          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
