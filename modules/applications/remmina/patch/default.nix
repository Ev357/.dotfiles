{
  lib,
  config,
  ...
}: let
  cfg = config.services.remmina;
in {
  options.services.remmina = {
    autostart = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to start the Remmina daemon automatically with the session.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.remmina.Install.WantedBy = lib.mkIf (!cfg.autostart) (lib.mkForce []);
  };
}
