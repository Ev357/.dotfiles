{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.services.traefik.enable {
    services.traefik = {
      package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.traefik;
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
            jellyfin = {port = 8096;};
            nextcloud = {port = 3080;};
            vaultwarden = {port = scfg.vaultwarden.config.ROCKET_PORT;};
            traefik = {
              port = 8080;
              extraRules = " || Host(`local.evest.dev`)";
            };
            home-assistant = {
              port = scfg.home-assistant.config.http.server_port;
              host = "home";
            };
            forgejo = {
              port = scfg.forgejo.settings.server.HTTP_PORT;
              host = "git";
            };
            atuin = {port = scfg.atuin.port;};
            immich = {port = scfg.immich.port;};
            jellyseerr = {port = scfg.jellyseerr.port;};
            radarr = {port = scfg.radarr.settings.server.port;};
            sonarr = {port = scfg.sonarr.settings.server.port;};
            prowlarr = {port = scfg.prowlarr.settings.server.port;};
            bazarr = {port = scfg.bazarr.listenPort;};
            qbittorrent = {port = scfg.qbittorrent.webuiPort;};
            anki = {port = scfg.anki-sync-server.port;};
          };

          mkRouter = name: cfg: let
            hostPrefix = cfg.host or name;
          in {
            rule = "Host(`${hostPrefix}.local.evest.dev`) || Host(`${hostPrefix}.ts.evest.dev`)${cfg.extraRules or ""}";
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

    networking.firewall.allowedTCPPorts = [8080 80 443];
  };
}
