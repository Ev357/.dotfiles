{
  lib,
  config,
  ...
}: {
  options.modules.ai = {
    enable = lib.mkEnableOption "enables ai";
  };

  config = lib.mkIf config.modules.ai.enable {
    # hipblast is not cached again...
    # services.ollama.enable = lib.mkDefault true;
    programs.gemini-cli.enable = lib.mkDefault true;
  };
}
