{
  pkgs,
  inputs,
  ...
}: {
  services.flaresolverr = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.flaresolverr;
  };
}
