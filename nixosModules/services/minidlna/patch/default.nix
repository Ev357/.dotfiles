{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.services.minidlna.enable {
    users.users."minidlna" = {
      extraGroups = ["media"];
    };
  };
}
