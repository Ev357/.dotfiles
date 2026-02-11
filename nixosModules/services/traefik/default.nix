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
        http = {
          routers = {
            jellyfin = {
              rule = "Host(`jellyfin.local.evest.dev`) || Host(`jellyfin.ts.evest.dev`)";
              service = "jellyfin";
              tls.certResolver = "letsencrypt";
            };

            nextcloud = {
              rule = "Host(`nextcloud.local.evest.dev`) || Host(`nextcloud.ts.evest.dev`)";
              service = "nextcloud";
              tls.certResolver = "letsencrypt";
            };

            vaultwarden = {
              rule = "Host(`vaultwarden.local.evest.dev`) || Host(`vaultwarden.ts.evest.dev`)";
              service = "vaultwarden";
              tls.certResolver = "letsencrypt";
            };

            traefik = {
              rule = "Host(`traefik.local.evest.dev`) || Host(`traefik.ts.evest.dev`) || Host(`local.evest.dev`)";
              service = "traefik";
              tls.certResolver = "letsencrypt";
            };

            home-assistant = {
              rule = "Host(`home.local.evest.dev`) || Host(`home.ts.evest.dev`)";
              service = "home-assistant";
              tls.certResolver = "letsencrypt";
            };

            forgejo = {
              rule = "Host(`git.local.evest.dev`) || Host(`git.ts.evest.dev`)";
              service = "forgejo";
              tls.certResolver = "letsencrypt";
            };

            atuin = {
              rule = "Host(`atuin.local.evest.dev`) || Host(`atuin.ts.evest.dev`)";
              service = "atuin";
              tls.certResolver = "letsencrypt";
            };

            immich = {
              rule = "Host(`immich.local.evest.dev`) || Host(`immich.ts.evest.dev`)";
              service = "immich";
              tls.certResolver = "letsencrypt";
            };

            jellyseerr = {
              rule = "Host(`jellyseerr.local.evest.dev`) || Host(`jellyseerr.ts.evest.dev`)";
              service = "jellyseerr";
              tls.certResolver = "letsencrypt";
            };

            radarr = {
              rule = "Host(`radarr.local.evest.dev`) || Host(`radarr.ts.evest.dev`)";
              service = "radarr";
              tls.certResolver = "letsencrypt";
            };

            sonarr = {
              rule = "Host(`sonarr.local.evest.dev`) || Host(`sonarr.ts.evest.dev`)";
              service = "sonarr";
              tls.certResolver = "letsencrypt";
            };

            prowlarr = {
              rule = "Host(`prowlarr.local.evest.dev`) || Host(`prowlarr.ts.evest.dev`)";
              service = "prowlarr";
              tls.certResolver = "letsencrypt";
            };

            qbittorrent = {
              rule = "Host(`qbittorrent.local.evest.dev`) || Host(`qbittorrent.ts.evest.dev`)";
              service = "qbittorrent";
              tls.certResolver = "letsencrypt";
            };
          };
          services = {
            jellyfin = {
              loadBalancer.servers = [
                {url = "http://localhost:8096";}
              ];
            };

            nextcloud = {
              loadBalancer.servers = [
                {url = "http://localhost:3080";}
              ];
            };

            vaultwarden = {
              loadBalancer.servers = [
                {url = "http://localhost:8222";}
              ];
            };

            traefik = {
              loadBalancer.servers = [
                {url = "http://localhost:8080";}
              ];
            };

            home-assistant = {
              loadBalancer.servers = [
                {url = "http://localhost:8123";}
              ];
            };

            forgejo = {
              loadBalancer.servers = [
                {url = "http://localhost:3081";}
              ];
            };

            atuin = {
              loadBalancer.servers = [
                {url = "http://localhost:8888";}
              ];
            };

            immich = {
              loadBalancer.servers = [
                {url = "http://localhost:2283";}
              ];
            };

            jellyseerr = {
              loadBalancer.servers = [
                {url = "http://localhost:5055";}
              ];
            };

            radarr = {
              loadBalancer.servers = [
                {url = "http://localhost:7878";}
              ];
            };

            sonarr = {
              loadBalancer.servers = [
                {url = "http://localhost:8989";}
              ];
            };

            prowlarr = {
              loadBalancer.servers = [
                {url = "http://localhost:9696";}
              ];
            };

            qbittorrent = {
              loadBalancer.servers = [
                {url = "http://localhost:8087";}
              ];
            };
          };
        };
      };
    };

    networking.firewall.allowedTCPPorts = [8080 80 443];
  };
}
