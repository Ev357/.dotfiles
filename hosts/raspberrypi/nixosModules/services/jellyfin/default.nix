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
      group = "media";
    };

    # DLNA
    networking.firewall.allowedUDPPorts = [
      1900
    ];
  };
}
