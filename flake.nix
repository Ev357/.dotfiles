{
  description = "Ev357's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://ev357.cachix.org"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://nixos-raspberrypi.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ev357.cachix.org-1:bI65rULXWJ8IMM+tosc/Z+9W53nL6uj4+5FLXX6BN3Q="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:danth/stylix";
    ags.url = "github:aylur/ags";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nix-gaming.url = "github:fufexan/nix-gaming";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cachix-deploy-flake = {
      url = "github:cachix/cachix-deploy-flake";
      inputs.home-manager.follows = "home-manager";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, cachix-deploy-flake, nixos-raspberrypi, nix-on-droid, home-manager, ... }@inputs:
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

        "evest@raspberrypi" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";

          modules = [
            ./hosts/raspberrypi/home.nix
            {
              home = {
                username = "evest";
                homeDirectory = "/home/evest";
                stateVersion = "25.05";
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

        "nix-on-droid" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."aarch64-linux";

          modules = [
            ./hosts/nix-on-droid/home.nix
            {
              home = {
                username = "nix-on-droid";
                homeDirectory = "/data/data/com.termux.nix/files/home";
                stateVersion = "24.05";
              };
            }
          ];

          extraSpecialArgs = { inherit inputs; };
        };
      };

      nixosConfigurations = {
        "nixos" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos/configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };
        "raspberrypi" = nixos-raspberrypi.lib.nixosSystem {
          modules = [
            ./hosts/raspberrypi/configuration.nix
          ];
          specialArgs = { inherit nixos-raspberrypi inputs; };
        };
      };

      nixOnDroidConfigurations = {
        default =
          let
            pkgs = import nixpkgs { system = "aarch64-linux"; };
          in
          nix-on-droid.lib.nixOnDroidConfiguration {
            inherit pkgs;
            modules = [
              ./hosts/nix-on-droid/configuration.nix
            ];
          };
      };

      packages =
        let
          mkCachixDeploy = system:
            let
              pkgs = nixpkgs.legacyPackages.${system};
              cachix-deploy-lib = cachix-deploy-flake.lib pkgs;
            in
            cachix-deploy-lib.spec {
              agents = {
                agent = cachix-deploy-lib.homeManager
                  {
                    extraSpecialArgs = { inherit inputs; };
                  }
                  {
                    imports = [
                      ./hosts/cachix/home.nix
                    ];

                    home = {
                      username = "evest";
                      homeDirectory = "/home/evest";
                      stateVersion = "24.11";
                    };
                  };
              };
            };
        in
        {
          "x86_64-linux".cachix = mkCachixDeploy "x86_64-linux";
          "aarch64-linux".cachix = mkCachixDeploy "aarch64-linux";
        };

      raspberryImage = self.nixosConfigurations."raspberrypi".config.system.build.sdImage;
    };
}
