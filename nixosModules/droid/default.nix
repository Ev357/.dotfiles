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
}
