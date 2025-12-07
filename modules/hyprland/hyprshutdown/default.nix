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
    home.packages = [
      inputs.hyprshutdown.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
