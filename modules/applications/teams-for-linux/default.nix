{
  lib,
  config,
  pkgs,
  ...
}: {
  options.modules.applications.teams-for-linux = {
    enable = lib.mkEnableOption "enables teams fox linux";
  };

  config = lib.mkIf config.modules.applications.teams-for-linux.enable {
    home.packages = with pkgs; [
      teams-for-linux
    ];

    xdg.configFile."teams-for-linux/config.json".source = (pkgs.formats.json {}).generate "teams-for-linux-config.json" {
      followSystemTheme = true;

      closeAppOnCross = true;
    };
  };
}
