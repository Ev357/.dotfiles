{ lib, config, pkgs, ... }:

{
  options.modules.packages = {
    enable = lib.mkEnableOption "enables packages";
  };

  config = lib.mkIf config.modules.packages.enable {
    environment.systemPackages = with pkgs; [
      vim
      wl-clipboard
      usbutils
      udiskie
      udisks
      networkmanagerapplet
      waybar
      openvpn
    ];
  };
}
