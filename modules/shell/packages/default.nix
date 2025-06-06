{ lib, config, pkgs, ... }:

{
  options.modules.shell.packages = {
    enable = lib.mkEnableOption "enables packages";
  };

  config = lib.mkIf config.modules.shell.packages.enable {
    home.packages = with pkgs; [
      (with dotnetCorePackages; combinePackages [
        sdk_6_0
        sdk_8_0
      ])
      openvpn
    ];

    nixpkgs.config.permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
    ];
  };
}
