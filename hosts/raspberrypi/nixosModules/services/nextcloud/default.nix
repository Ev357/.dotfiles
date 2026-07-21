{
  pkgs,
  inputs,
  ...
}: {
  services = {
    nextcloud = {
      package = let
        nextcloud = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nextcloud32;
      in
        nextcloud
        // {
          override = args: nextcloud.override (removeAttrs args ["caBundle"]);
        };
      hostName = "nextcloud";
      config = {
        dbtype = "sqlite";
        adminpassFile = "/etc/nextcloud-admin-pass";
      };
      settings = {
        trusted_domains = [
          "nextcloud.evest.dev"
          "nextcloud.local.evest.dev"
          "nextcloud.ts.evest.dev"
          "raspberrypi"
        ];
        overwriteprotocol = "https";
      };
    };
  };
}
