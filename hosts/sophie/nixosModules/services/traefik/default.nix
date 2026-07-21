{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.services.traefik.enable {
    services.traefik = {
      environmentFiles = ["/etc/traefik/secrets/traefik.env"];
      staticConfigOptions = {
        entryPoints = {
          web = {
            address = ":80";
            asDefault = true;
            http.redirections.entrypoint = {
              to = "websecure";
              scheme = "https";
            };
          };
          websecure = {
            address = ":443";
            asDefault = true;
            http.tls.certResolver = "letsencrypt";
            transport.respondingTimeouts = {
              readTimeout = "300s";
            };
          };
        };
        certificatesResolvers.letsencrypt.acme = {
          email = "evest@evest.dev";
          storage = "${config.services.traefik.dataDir}/acme.json";
          dnsChallenge = {
            provider = "cloudflare";
            delayBeforeCheck = 120;
          };
        };

        api = {
          dashboard = true;
          insecure = true;
        };
      };

      dynamicConfigOptions = {
        http = let
          scfg = config.services;

          apps = {
            nextcloud = {port = 3080;};
            traefik = {
              port = 8080;
              extraRules = " || Host(`sophie-local.evest.dev`)";
            };
            immich = {port = scfg.immich.port;};
          };

          mkRouter = name: cfg: let
            hostPrefix = cfg.host or name;
          in {
            rule = "Host(`${hostPrefix}.sophie-local.evest.dev`) || Host(`${hostPrefix}.sophie-ts.evest.dev`)${cfg.extraRules or ""}";
            service = name;
            tls.certResolver = "letsencrypt";
          };

          mkService = name: cfg: {
            loadBalancer.servers = [{url = "http://localhost:${toString cfg.port}";}];
          };
        in {
          routers = lib.mapAttrs mkRouter apps;
          services = lib.mapAttrs mkService apps;
        };
      };
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
