{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./patch
  ];

  services.atuin = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.system}.atuin;
    openFirewall = true;
    database = {
      createLocally = false;
      uri = "sqlite:///data/services/atuin/atuin.db";
    };
  };
}
