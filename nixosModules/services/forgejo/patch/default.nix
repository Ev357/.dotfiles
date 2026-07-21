{
  config,
  lib,
  ...
}: let
  cfg = config.services.forgejo;
in {
  options.services.forgejo = {
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to open the vaultwarden port in the firewall";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = lib.mkIf cfg.openFirewall [
      cfg.settings.server.HTTP_PORT
    ];
  };
}
