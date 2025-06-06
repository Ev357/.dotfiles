{ lib, config, pkgs, ... }:

{
  options.modules.applications.other = {
    enable = lib.mkEnableOption "enables other applications";
  };

  config = lib.mkIf config.modules.applications.other.enable {
    home.packages = with pkgs; [
      nautilus
      loupe
      remmina
      fragments
    ];
  };
}
