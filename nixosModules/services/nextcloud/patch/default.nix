{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.services.nextcloud.enable {
    users.users."nextcloud" = {
      extraGroups = ["media"];
    };
  };
}
