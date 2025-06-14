{ lib, config, pkgs, ... }:

{
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.jellyfin.enable {
    services.jellyfin = {
      openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];
  };
}
