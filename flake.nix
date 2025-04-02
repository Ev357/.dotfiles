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
    stylix.url = "github:danth/stylix";
  };

  outputs = { nixpkgs, home-manager, nixvim, stylix, ... }@inputs:
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

        extraSpecialArgs = { inherit inputs; };
      };
      packages.${system}.nixvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
        module = import ./programs/nixvim;
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
