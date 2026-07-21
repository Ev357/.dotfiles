{
  pkgs,
  inputs,
  ...
}: {
  services.seerr = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.seerr;
  };
}
