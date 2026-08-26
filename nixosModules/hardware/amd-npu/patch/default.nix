{
  lib,
  config,
  ...
}: let
  cfg = config.hardware.amd-npu;
in {
  config = lib.mkIf cfg.enable {
    environment.pathsToLink = lib.optionals cfg.enableFastFlowLM ["/share/flm"];
  };
}
