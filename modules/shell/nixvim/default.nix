{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = import ./standalone.nix { inherit pkgs; } // {
    defaultEditor = true;
  };
}
