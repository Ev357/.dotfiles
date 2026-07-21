{
  config,
  lib,
  ...
}: let
  cfg = config.services.atuin;
in {
  options.services.atuin = {
    group = lib.mkOption {
      type = lib.types.str;
      default = "atuin";
      description = "The group atuin should run as.";
    };
  };

  config = lib.mkIf config.services.atuin.enable {
    systemd.services.atuin.serviceConfig = {
      User = "atuin";
      DynamicUser = lib.mkForce false;
      ExecStart = lib.mkForce "${lib.getExe' config.services.atuin.package "atuin-server"} start";
    };

    users.users."atuin" = {
      isSystemUser = true;
      group = cfg.group;
    };
  };
}
