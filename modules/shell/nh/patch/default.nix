{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.nh.enable {
    modules.uwsm.environmentVariables = {
      NH_FLAKE = config.programs.nh.flake;
    };
  };
}
