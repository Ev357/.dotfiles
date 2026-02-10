{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.services.jellyfin.enable {
    services.jellyfin = {
      package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.jellyfin;
      openFirewall = true;
      group = "media";
    };

    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-web
      jellyfin-ffmpeg
    ];
  };
}
