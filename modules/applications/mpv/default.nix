{pkgs, ...}: let
  catppuccin-mpv = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "mpv";
    rev = "08e90daf511eee2c10c98f0031b51bb9de240d60";
    sha256 = "sha256-oUheJNWk2R6gNEmkK8H6PWX0iofx2KMGDoFWtnr420A=";
  };
in {
  programs.mpv = {
    scripts = with pkgs.mpvScripts; [
      mpris
    ];
    includes = [
      "${catppuccin-mpv}/themes/macchiato/lavender.conf"
    ];
  };
}
