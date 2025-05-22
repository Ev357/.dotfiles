{ pkgs, ... }@inputs:

{
  programs.rofi = {
    package = pkgs.rofi-wayland;
    theme = import ./theme.nix inputs;
  };
}
