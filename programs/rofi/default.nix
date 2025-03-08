{ pkgs, ... }@inputs:

{
  enable = true;
  package = pkgs.rofi-wayland;
  theme = import ./theme.nix inputs;
}
