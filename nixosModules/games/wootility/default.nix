{
  lib,
  pkgs,
  config,
  ...
}: let
  wooting = pkgs.callPackage ./package {};
in {
  options.modules.games.wootility = {
    enable = lib.mkEnableOption "enables wootility udev rule";
  };

  config = lib.mkIf config.modules.games.wootility.enable {
    services.udev.packages = [wooting];
  };
}
