{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./minecraft
    ./osu
  ];

  options.modules.games = {
    enable = lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.modules.games.enable {
    modules.games = {
      osu.enable = lib.mkDefault true;
      minecraft.enable = lib.mkDefault true;
    };

    home.packages = with pkgs; [
      lunar-client
      (heroic.override {
        extraPkgs = pkgs:
          with pkgs; [
            gamescope
          ];
      })
      lutris

      dwarfs
      fuse-overlayfs
      bubblewrap
      wine-staging
    ];

    modules.electron-flags.enable = true;

    wayland.windowManager.hyprland.settings.env = [
      "SDL_VIDEODRIVER,wayland"
    ];
  };
}
