{ lib, config, ... }:

{
  options.modules.applications.electron-flags = {
    enable = lib.mkEnableOption "enables electron flags";
  };

  config = lib.mkIf config.modules.applications.electron-flags.enable {
    home.file.".config/electron-flags.conf".source = ./electron-flags.conf;
  };
}
