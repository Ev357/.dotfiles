{
  lib,
  config,
  ...
}: {
  options.modules.ai = {
    enable = lib.mkEnableOption "enables ai";
  };

  config = lib.mkIf config.modules.ai.enable {
    programs = {
      pi-coding-agent.enable = lib.mkDefault true;
      flm-add.enable = lib.mkDefault true;
    };
  };
}
