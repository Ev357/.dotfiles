{ lib, config, ... }:

{
  imports = [
    ./osu
  ];

  options.modules.games = {
    enable = lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.modules.games.enable {
    modules.games.osu.enable = lib.mkDefault true;

    modules.electron-flags.enable = true;

    wayland.windowManager.hyprland.settings.env = [
      "SDL_VIDEODRIVER,wayland"
    ];
  };
}
