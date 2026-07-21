{
  inputs,
  pkgs,
  ...
}: {
  services.vaultwarden = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.vaultwarden;
    config = {
      ROCKET_ADDRESS = "::1";
      ROCKET_PORT = 8222;
      SIGNUPS_ALLOWED = false;
    };
    backupDir = "/data/backups/vaultwarden";
    group = "media";
  };
}
