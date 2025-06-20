{ config, lib, pkgs, ... }:

let
  cfg = config.services.forgejo;
  srv = cfg.settings.server;

  theme = pkgs.fetchzip {
    url = "https://github.com/catppuccin/gitea/releases/download/v1.0.2/catppuccin-gitea.tar.gz";
    sha256 = "sha256-rZHLORwLUfIFcB6K9yhrzr+UwdPNQVSadsw6rg8Q7gs=";
    stripRoot = false;
  };
in
{
  config = lib.mkIf config.services.forgejo.enable {
    services.forgejo = {
      database.type = "postgres";
      lfs.enable = true;
      settings = {
        server = {
          DOMAIN = "git.ts.evest.dev";
          ROOT_URL = "https://${srv.DOMAIN}/";
          HTTP_PORT = 3081;
        };
        service.DISABLE_REGISTRATION = true;
        actions = {
          ENABLED = true;
          DEFAULT_ACTIONS_URL = "github";
        };
        ui = {
          THEMES = "catppuccin-macchiato-lavender";
          DEFAULT_THEME = "catppuccin-macchiato-lavender";
        };
      };
    };

    systemd.services.forgejo.preStart = lib.mkAfter /* bash */ ''
      rm -rf ${cfg.stateDir}/custom/public/assets
      mkdir -p ${cfg.stateDir}/custom/public/assets
      ln -sf ${theme} ${cfg.stateDir}/custom/public/assets/css
    '';

    networking.firewall.allowedTCPPorts = [ srv.HTTP_PORT ];
  };
}
