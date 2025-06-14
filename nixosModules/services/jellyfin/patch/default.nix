{ config, lib, ... }:

{
  config = lib.mkIf config.services.jellyfin.enable {
    users.users."jellyfin" = {
      extraGroups = [ "media" ];
    };
  };
}
