{pkgs, ...}: {
  imports = [
    ./theme.nix
  ];

  programs.rofi = {
    package = pkgs.rofi-wayland;
  };
}
