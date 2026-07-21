{
  pkgs,
  inputs,
  ...
}: {
  services.anki-sync-server = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.anki-sync-server;
    baseDirectory = "/data/anki";
    users = [
      {
        username = "evest";
        passwordFile = "/etc/anki-sync-server/evest";
      }
    ];
    environment = {
      PASSWORDS_HASHED = "1";
    };
    group = "media";
  };
}
