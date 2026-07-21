{pkgs, ...}: {
  services = {
    nextcloud = {
      package = pkgs.nextcloud33;
      hostName = "nextcloud";
      config = {
        dbtype = "sqlite";
        adminpassFile = "/etc/nextcloud-admin-pass";
      };
      settings = {
        trusted_domains = [
          "nextcloud.sophie-local.evest.dev"
          "nextcloud.sophie-ts.evest.dev"
          "sophie"
        ];
        overwriteprotocol = "https";
      };
    };
  };
}
