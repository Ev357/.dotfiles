{
  lib,
  config,
  ...
}: {
  options.modules.ai = {
    enable = lib.mkEnableOption "enables ai";
  };

  config = lib.mkIf config.modules.ai.enable {
    services.ollama.enable = lib.mkDefault true;
    programs.pi-coding-agent.enable = lib.mkDefault true;
  };
}
