{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options.programs.hyprshutdown = {
    enable = lib.mkEnableOption "enables hyprshutdown";
  };

  config = lib.mkIf config.programs.hyprshutdown.enable {
    home.packages = with pkgs; [
      hyprshutdown
    ];
  };
}
