{ lib, config, ... }:

{
  imports = [
    ./common
    ./packages
    ./sshd
  ];

  options.droidModules = {
    enable = lib.mkEnableOption "droid modules";
  };

  config = {
    disabledModules =
      lib.optionals config.droidModules.enable [
        "nixosModules/common"
      ] ++
      lib.optionals (!config.droidModules.enable) [
        "nixosModules/droid/common"
      ];
  };
}
