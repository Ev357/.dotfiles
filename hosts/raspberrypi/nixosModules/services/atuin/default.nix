{
  pkgs,
  inputs,
  ...
}: {
  services.atuin = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.atuin;
    database = {
      createLocally = false;
      uri = "sqlite:///data/services/atuin/atuin.db";
    };
    group = "media";
  };
}
