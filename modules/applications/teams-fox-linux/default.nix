{ lib, config, pkgs, ... }:

{
  options.modules.applications.teams-fox-linux = {
    enable = lib.mkEnableOption "enables teams fox linux";
  };

  config = lib.mkIf config.modules.applications.teams-fox-linux.enable {
    home.packages = with pkgs; [
      teams-for-linux
    ];
    xdg.configFile."teams-for-linux/config.json".source = (pkgs.formats.json { }).generate "teams-for-linux-config.json" {
      followSystemTheme = true;
      closeAppOnCross = true;
    };
  };
}
