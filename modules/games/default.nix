{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  pkgs-stable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  imports = [
    ./osu
    ./prismlauncher
  ];

  options.modules.games = {
    enable = lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.modules.games.enable {
    modules.games = {
      osu.enable = lib.mkDefault true;
    };

    programs = {
      prismlauncher.enable = lib.mkDefault true;
    };

    home.packages = with pkgs; [
      (heroic.override {
        extraPkgs = pkgs:
          with pkgs; [
            gamescope
            vlc
          ];
      })
      pkgs-stable.lutris
    ];

    modules.electron-flags.enable = true;
  };
}
