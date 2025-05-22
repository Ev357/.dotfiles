{ lib, config, pkgs, ... }:

{
  options.modules.games.osu = {
    enable = lib.mkEnableOption "enables osu";
    noInstall = lib.mkEnableOption "doesn't install osu";
  };

  config = lib.mkIf config.modules.games.osu.enable {
    home.packages = lib.mkIf (!config.modules.games.osu.noInstall) (with pkgs; [
      osu-lazer-bin
    ]);

    modules.applications.opentabletdriver.enable = true;
  };
}
