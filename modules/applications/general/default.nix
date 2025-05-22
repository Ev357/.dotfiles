{ lib, config, pkgs, ... }:

{
  options.modules.applications.general = {
    enable = lib.mkEnableOption "enables general";
  };

  config = lib.mkIf config.modules.applications.general.enable {
    home.packages = with pkgs; [
      nautilus
    ];
  };
}
