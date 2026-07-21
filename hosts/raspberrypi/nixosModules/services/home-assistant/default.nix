{
  pkgs,
  inputs,
  ...
}: {
  services.home-assistant = {
    package = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.home-assistant;
  };
}
