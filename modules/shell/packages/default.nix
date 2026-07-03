{
  lib,
  config,
  pkgs,
  ...
}: {
  options.modules.shell.packages = {
    enable = lib.mkEnableOption "enables packages";
  };

  config = lib.mkIf config.modules.shell.packages.enable {
    home.packages = with pkgs; [
      openvpn
    ];
  };
}
