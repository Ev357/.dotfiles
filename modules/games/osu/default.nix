{ lib, config, pkgs, inputs, ... }:

{
  options.modules.games.osu = {
    enable = lib.mkEnableOption "enables osu";
    noInstall = lib.mkEnableOption "doesn't install osu";
  };

  config = lib.mkIf config.modules.games.osu.enable {
    home.packages = lib.mkIf (!config.modules.games.osu.noInstall) (with pkgs; [
      (inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin.override {
        releaseStream = "tachyon";
        pipewire_latency = "512/48000";
      })
      wootility
    ]);

    modules.applications.opentabletdriver.enable = true;
  };
}
