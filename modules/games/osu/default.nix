{ lib, config, pkgs, system, ... }:

{
  options.modules.games.osu = {
    enable = lib.mkEnableOption "enables osu";
    noInstall = lib.mkEnableOption "doesn't install osu";
  };

  config = lib.mkIf config.modules.games.osu.enable {
    home.packages = lib.mkIf (!config.modules.games.osu.noInstall) (with pkgs; [
      inputs.nix-gaming.packages.${system}.osu-lazer-bin
      wootility
    ]);

    modules.applications.opentabletdriver.enable = true;
  };
}
