{
  lib,
  config,
  ...
}: let
  cfg = config.services.easyeffects;
in {
  options.services.easyeffects = {
    autostart = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to start the Easyeffects daemon automatically with the session.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.easyeffects.Install.WantedBy = lib.mkIf (!cfg.autostart) (lib.mkForce []);
  };
}
