{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.services.atuin.enable {
    systemd.services.atuin.serviceConfig = {
      User = "atuin";
      DynamicUser = lib.mkForce false;
    };

    users.users."atuin" = {
      isSystemUser = true;
      group = "media";
    };
  };
}
