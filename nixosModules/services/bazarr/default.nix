{
  pkgs,
  inputs,
  ...
}: {
  services.bazarr = {
    package = inputs.nixpkgs-latest.legacyPackages.${pkgs.stdenv.hostPlatform.system}.bazarr;
    openFirewall = true;
    group = "media";
    dataDir = "/data/services/bazarr";
  };
}
