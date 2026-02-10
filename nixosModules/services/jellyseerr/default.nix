{
  pkgs,
  inputs,
  ...
}: {
  services.jellyseerr = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.jellyseerr;
    openFirewall = true;
  };
}
