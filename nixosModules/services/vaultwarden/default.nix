{
  config,
  lib,
  inputs,
  pkgs,
  ...
}: {
  config = lib.mkIf config.services.vaultwarden.enable {
    services.vaultwarden = {
      package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.vaultwarden;

      config = {
        ROCKET_ADDRESS = "::1";
        ROCKET_PORT = 8222;
        SIGNUPS_ALLOWED = false;
      };

      backupDir = "/data/backups/vaultwarden";
    };

    networking.firewall.allowedTCPPorts = [
      config.services.vaultwarden.config.ROCKET_PORT
    ];

    users.users."vaultwarden" = {
      extraGroups = ["media"];
    };
  };
}
