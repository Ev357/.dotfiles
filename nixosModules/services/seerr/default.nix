{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./patch
  ];

  services.seerr = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.seerr;
    configDir = "/var/lib/seerr/";
    openFirewall = true;
  };
}
