{ lib, config, pkgs, ... }:

{
  options.modules.applications.applications = {
    enable = lib.mkEnableOption "enables applications";
  };

  config = lib.mkIf config.modules.applications.applications.enable {
    home.packages = with pkgs; [
      nautilus
    ];
  };
}
