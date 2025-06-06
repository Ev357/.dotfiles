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

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    cachix-deploy-flake = {
      url = "github:cachix/cachix-deploy-flake";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = { nixpkgs, cachix-deploy-flake, home-manager, ... }@inputs:
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
    };
}
