{ lib, config, pkgs, ... }:

{
  options.modules.applications.mpv = {
    enable = lib.mkEnableOption "enables mpv";
  };

  config = lib.mkIf config.modules.applications.mpv.enable {
    home = {
      packages = with pkgs; [
        mpv
      ];

      file.".config/mpv/mpv.conf".source = ./mpv.conf;
    };
  };
}
