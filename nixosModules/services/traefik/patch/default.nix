{
  config,
  lib,
  ...
}: let
  cfg = config.services.traefik;
in {
  options.services.traefik = {
    openFirewall = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to open the traefik port in the firewall";
    };
  };

  config = lib.mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = lib.mkIf cfg.openFirewall [8080];
  };
}
