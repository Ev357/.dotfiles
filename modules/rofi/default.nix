{ pkgs, ... }@inputs:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = import ./theme.nix inputs;
  };
}
