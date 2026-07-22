{
  pkgs,
  inputs,
  ...
}: {
  services.jellyfin = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.jellyfin;
    group = "media";
  };
}
