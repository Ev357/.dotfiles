{
  pkgs,
  inputs,
  ...
}: {
  services.bazarr = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.bazarr;
    group = "media";
    dataDir = "/data/services/bazarr";
  };
}
