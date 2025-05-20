{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mpv
  ];

  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;
}
