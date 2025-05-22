{ lib, config, pkgs, ... }:

{
  options.modules.games.osu = {
    enable = lib.mkEnableOption "enables osu";
  };

  config = lib.mkIf config.modules.games.osu.enable {
    home.packages = with pkgs; [ osu-lazer-bin ];

    modules.applications.opentabletdriver.enable = true;
  };
}
