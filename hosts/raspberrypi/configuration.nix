{ nixos-raspberrypi, config, pkgs, ... }:

{
  imports = [
    nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    nixos-raspberrypi.nixosModules.sd-image
    ../../nixosModules
  ];

  modules = {
    packages.enable = true;
  };

  programs = {
    zsh.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings.PermitRootLogin = "yes";
    };
  };

  users.users."evest" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    initialPassword = "12345678";
  };

  networking = {
    hostName = "raspberrypi";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Prague";

  environment.enableAllTerminfo = true;

  system.nixos.tags =
    let
      cfg = config.boot.loader.raspberryPi;
    in
    [
      "raspberry-pi-${cfg.variant}"
      cfg.bootloader
      config.boot.kernelPackages.kernel.version
    ];

  system.stateVersion = config.system.nixos.release;
}
