{
  pkgs,
  inputs,
  ...
}: {
  services.immich = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.immich;
    group = "media";
    mediaLocation = "/data/services/immich";
  };
}
