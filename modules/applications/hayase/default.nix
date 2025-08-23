{
  lib,
  config,
  pkgs,
  ...
}: {
  options.modules.applications.hayase = {
    enable = lib.mkEnableOption "enables hayase";
  };

  config = lib.mkIf config.modules.applications.hayase.enable {
    home.packages = [
      (pkgs.callPackage ./package {})
    ];
  };
}
