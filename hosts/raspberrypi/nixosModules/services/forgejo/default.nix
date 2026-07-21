{
  pkgs,
  inputs,
  ...
}: {
  services.forgejo = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.forgejo;
    group = "media";
    repositoryRoot = "/data/services/forgejo";
    settings = {
      server = rec {
        DOMAIN = "git.ts.evest.dev";
        ROOT_URL = "https://${DOMAIN}/";
        HTTP_PORT = 3081;
      };
      service.DISABLE_REGISTRATION = true;
    };
  };
}
