{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.services.jellyfin.enable {
    services.jellyfin = {
      group = "media";
      hardwareAcceleration = {
        enable = true;
        type = "vaapi";
        device = "/dev/dri/renderD128";
      };
    };

    # DLNA
    networking.firewall.allowedUDPPorts = [
      1900
    ];
  };
}
