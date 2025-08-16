{
  lib,
  config,
  pkgs,
  ...
}: {
  options.modules.games.minecraft = {
    enable = lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.modules.games.minecraft.enable {
    home.packages = with pkgs; [
      prismlauncher
    ];
  };
}
