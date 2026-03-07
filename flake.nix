{
  description = "Ev357's dotfiles";

  nixConfig = {
    extra-substituters = [
      "https://ev357.cachix.org"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
      "https://nixos-raspberrypi.cachix.org"
      "https://nix-gaming.cachix.org"
      "https://ghostty.cachix.org"
      "https://tano.cachix.org"
    ];
    extra-trusted-public-keys = [
      "ev357.cachix.org-1:bI65rULXWJ8IMM+tosc/Z+9W53nL6uj4+5FLXX6BN3Q="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nixos-raspberrypi.cachix.org-1:4iMO9LXa8BqhU+Rpg6LQKiGa2lsNh/j2oiYLNOQ5sPI="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      "tano.cachix.org-1:Vi3qOkAzZY0PVB7ca3Kp03gURYrEFK7gNdX2thodn7I="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    stylix.url = "github:nix-community/stylix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";
    nix-gaming.url = "github:fufexan/nix-gaming";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nur.url = "github:nix-community/NUR";
    tano.url = "github:Ev357/tano";
    template-manager.url = "github:Ev357/template-manager";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-raspberrypi,
    nix-on-droid,
    home-manager,
    nixvim,
    ...
  } @ inputs: let
    forAllSystems = nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed;
  in {
    homeConfigurations = {
      "evest@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";

        modules = [
          ./hosts/nixos/home.nix
        ];

        extraSpecialArgs = {inherit inputs;};
      };

      "evest@raspberrypi" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";

        modules = [
          ./hosts/raspberrypi/home.nix
        ];

        extraSpecialArgs = {inherit inputs;};
      };

      "evest@lucasgager" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";

        modules = [
          ./hosts/lucasgager/home.nix
        ];

        extraSpecialArgs = {inherit inputs;};
      };

      "nix-on-droid" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";

        modules = [
          ./hosts/nix-on-droid/home.nix
        ];

        extraSpecialArgs = {inherit inputs;};
      };
    };

    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./hosts/nixos/configuration.nix
        ];
        specialArgs = {inherit inputs;};
      };

      "raspberrypi" = nixos-raspberrypi.lib.nixosSystem {
        modules = [
          ./hosts/raspberrypi/configuration.nix
        ];

        specialArgs = {inherit nixos-raspberrypi inputs;};
      };

      "lucasgager" = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/lucasgager/configuration.nix
        ];

        specialArgs = {inherit inputs;};
      };
    };

    nixOnDroidConfigurations = {
      default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = nixpkgs.legacyPackages."aarch64-linux";

        modules = [
          ./hosts/nix-on-droid/configuration.nix
        ];

        extraSpecialArgs = {inherit inputs;};
      };
    };

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    packages = forAllSystems (system: {
      nixvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        module = import ./modules/shell/nixvim/standalone.nix;
        extraSpecialArgs = {inherit inputs system;};
      };
    });

    raspberryImage = self.nixosConfigurations."raspberrypi".config.system.build.sdImage;
  };
}
