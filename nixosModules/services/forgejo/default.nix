{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.forgejo;

  theme = pkgs.fetchzip {
    url = "https://github.com/catppuccin/gitea/releases/download/v1.0.2/catppuccin-gitea.tar.gz";
    sha256 = "sha256-rZHLORwLUfIFcB6K9yhrzr+UwdPNQVSadsw6rg8Q7gs=";
    stripRoot = false;
  };
in {
  imports = [
    ./patch
  ];

  config = lib.mkIf cfg.enable {
    services.forgejo = {
      openFirewall = true;
      database.type = "postgres";
      lfs.enable = true;
      settings = {
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

    systemd.services.forgejo.preStart =
      lib.mkAfter
      # bash
      ''
        rm -rf ${cfg.stateDir}/custom/public/assets
        mkdir -p ${cfg.stateDir}/custom/public/assets
        ln -sf ${theme} ${cfg.stateDir}/custom/public/assets/css
      '';
  };
}
