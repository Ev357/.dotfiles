{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.hardware.amd-npu;
in {
  config = lib.mkIf cfg.enable {
    environment.pathsToLink = lib.optionals cfg.enableFastFlowLM ["/share/flm"];

    nixpkgs.overlays = lib.mkIf cfg.enableFastFlowLM [
      (_: _: {
        fastflowlm = pkgs.nur.repos.Ev357.openflowlm;
      })
    ];
  };
}
