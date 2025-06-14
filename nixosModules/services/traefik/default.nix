{ config, lib, ... }:

{
  config = lib.mkIf config.services.traefik.enable {
    services.traefik = {
      environmentFiles = [ "/etc/traefik/secrets/traefik.env" ];
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
              rule = "Host(`jellyfin.local.evest.dev`)";
              service = "jellyfin";
              tls.certResolver = "letsencrypt";
            };

            nextcloud = {
              rule = "Host(`nextcloud.local.evest.dev`)";
              service = "nextcloud";
              tls.certResolver = "letsencrypt";
            };

            vaultwarden = {
              rule = "Host(`vaultwarden.local.evest.dev`)";
              service = "vaultwarden";
              tls.certResolver = "letsencrypt";
            };

            traefik = {
              rule = "Host(`traefik.local.evest.dev`) || Host(`local.evest.dev`)";
              service = "traefik";
              tls.certResolver = "letsencrypt";
            };

            home-assistant = {
              rule = "Host(`home.local.evest.dev`)";
              service = "home-assistant";
              tls.certResolver = "letsencrypt";
            };
          };
          services = {
            jellyfin = {
              loadBalancer.servers = [
                { url = "http://localhost:8096"; }
              ];
            };

            nextcloud = {
              loadBalancer.servers = [
                { url = "http://localhost:3080"; }
              ];
            };

            vaultwarden = {
              loadBalancer.servers = [
                { url = "http://localhost:8222"; }
              ];
            };

            traefik = {
              loadBalancer.servers = [
                { url = "http://localhost:8080"; }
              ];
            };

            home-assistant = {
              loadBalancer.servers = [
                { url = "http://localhost:8123"; }
              ];
            };
          };
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 8080 80 443 ];
  };
}
