{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.disko.nixosModules.disko
    ./hardware-configuration.nix
    ./disk-config.nix
    ./nixosModules
    ../../nixosModules
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with pkgs; [
      nur.repos.Ev357.alx-wol
    ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  modules = {
    packages.enable = true;
  };

  services = {
    openssh.enable = true;
    fwupd.enable = true;
    tailscale.enable = true;
    immich.enable = true;
  };

  environment.shells = with pkgs; [
    nushell
  ];

  users = {
    users."evest" = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager" "media"];
      shell = pkgs.nushell;
      initialPassword = "12345678";
    };
    groups = {
      media = {};
    };
  };

  networking = {
    hostName = "sophie";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Prague";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "cz";

  environment.enableAllTerminfo = true;

  system.stateVersion = "26.05";
}
