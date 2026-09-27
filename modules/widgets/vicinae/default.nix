{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.programs.vicinae.enable {
    programs.vicinae = {
      settings = {
        theme = {
          dark.name = "catppuccin-macchiato";
          light.name = "catppuccin-macchiato";
        };
        tray = {
          enabled = false;
        };
        global_shortcuts.toggle = "";
        providers = {
          "@bl4zee1g/${pkgs.nur.repos.Ev357.vicinae-bitwarden.name}" = {
            preferences = {
              rbwPath = "${config.programs.rbw.package}/bin/rbw";
            };
          };
        };
      };
      systemd.enable = true;
      extensions = with pkgs; [
        nur.repos.Ev357.raycast-jisho
        nur.repos.Ev357.vicinae-bitwarden
        nur.repos.Ev357.vicinae-nix
      ];
    };

    programs.rbw.enable = true;
  };
}
