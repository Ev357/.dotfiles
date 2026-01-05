{
  pkgs,
  inputs,
  ...
}: {
  services.immich = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.immich;
    openFirewall = true;
    group = "media";
    mediaLocation = "/data/services/immich";
  };
}
