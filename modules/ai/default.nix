{
  lib,
  config,
  ...
}: {
  imports = [
    ./ollama
  ];

  options.modules.ai = {
    enable = lib.mkEnableOption "enables ai";
  };

  config = lib.mkIf config.modules.ai.enable {
    services.ollama.enable = lib.mkDefault true;
  };
}
