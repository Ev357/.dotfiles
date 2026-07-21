{
  config,
  lib,
  ...
}: let
  cfg = config.services.vaultwarden;
in {
  options.services.vaultwarden = {
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to open the vaultwarden port in the firewall";
    };
    group = lib.mkOption {
      type = lib.types.str;
      default = "vaultwarden";
      description = "The group vaultwarden sync server should run as.";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = lib.mkIf cfg.openFirewall [
      cfg.config.ROCKET_PORT
    ];

    users.users."vaultwarden" = {
      extraGroups = [cfg.group];
    };
  };
}
