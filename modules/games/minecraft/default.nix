{ lib, config, pkgs, ... }:

{
  options.modules.games.minecraft = {
    enable = lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.modules.games.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];

    # https://github.com/NixOS/nixpkgs/issues/425323
    nixpkgs.overlays = [
      (final: prev: {
        jdk8 = final.openjdk8-bootstrap;
      })
    ];
  };
}
