{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./patch
  ];

  services.atuin = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.atuin;
    openFirewall = true;
    database = {
      createLocally = false;
      uri = "sqlite:///data/services/atuin/atuin.db";
    };
  };
}
