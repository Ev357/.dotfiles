{ lib, config, pkgs, ... }:

{
  options.modules.games.minecraft = {
    enable = lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.modules.games.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];

    # jdk8 is not cached for some reason
    nixpkgs.overlays = [
      (final: prev: {
        jdk8 = final.openjdk8-bootstrap;
      })
    ];
  };
}
