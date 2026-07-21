{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.services.immich.enable {
    services.immich = {
      openFirewall = true;
      accelerationDevices = null;
    };

    users.users.immich.extraGroups = ["video" "render"];
  };
}
