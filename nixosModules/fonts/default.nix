{ lib, config, pkgs, ... }:

{
  options.modules.fonts = {
    enable = lib.mkEnableOption "enables fonts";
  };

  config = lib.mkIf config.modules.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
    ];
  };
}
