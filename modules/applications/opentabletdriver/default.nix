{ lib, config, ... }:

{
  options.modules.applications.opentabletdriver = {
    enable = lib.mkEnableOption "enables opentabletdriver";
  };

  config = lib.mkIf config.modules.applications.opentabletdriver.enable {
    home.file.".config/OpenTabletDriver/Presets/".source = ./Presets;
  };
}
