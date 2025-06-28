{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.nixvim = (import ./standalone.nix { inherit pkgs; }) // {
    defaultEditor = true;

    _module.args = {
      inherit inputs;
    };
  };
}
