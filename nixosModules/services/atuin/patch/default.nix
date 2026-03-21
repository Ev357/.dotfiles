{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.services.atuin.enable {
    systemd.services.atuin.serviceConfig = {
      User = "atuin";
      DynamicUser = lib.mkForce false;
      ExecStart = lib.mkForce "${lib.getExe' config.services.atuin.package "atuin-server"} start";
    };

    users.users."atuin" = {
      isSystemUser = true;
      group = "media";
    };
  };
}
