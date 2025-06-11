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

  services = {
    openssh.enable = true;
  };

  users.users = {
    "evest" = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
      shell = pkgs.zsh;
      initialPassword = "12345678";
    };
    "root" = {
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP26vuM5GVmxiOzpH51hJYhXLgzhOgqS4MWe8hKUMiG8 evest@nixos"
      ];
    };
  };

  networking = {
    hostName = "raspberrypi";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Prague";

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
