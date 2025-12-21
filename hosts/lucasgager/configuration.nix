{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../nixosModules
    ./hardware-configuration.nix
    ./disk-config.nix
    inputs.disko.nixosModules.disko
    inputs.nixos-hardware.nixosModules.dell-latitude-7490
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
    binfmt.emulatedSystems = ["aarch64-linux"];
  };

  modules = {
    packages.enable = true;
  };

  programs = {
    hyprland.enable = true;
    nix-ld.enable = true;
    light.enable = true;
    localsend = {
      enable = true;
      package = pkgs.emptyDirectory;
    };
    evolution = {
      enable = true;
      plugins = with pkgs; [
        evolution-ews
      ];
    };
  };

  services = {
    fwupd.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tailscale.enable = true;
    printing.enable = true;
    blueman.enable = true;
    power-profiles-daemon.enable = true;

    xserver = {
      xkb.layout = "cz";
      videoDrivers = ["modesetting"];
    };
  };

  security.pam.services.login.enableGnomeKeyring = true;

  hardware.bluetooth.enable = true;
  powerManagement.enable = true;

  environment.shells = with pkgs; [
    nushell
  ];

  users.users."evest" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.nushell;
  };

  networking = {
    hostName = "lucasgager";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };

  time.timeZone = "Europe/Prague";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "cs_CZ.UTF-8";
      LC_IDENTIFICATION = "cs_CZ.UTF-8";
      LC_MEASUREMENT = "cs_CZ.UTF-8";
      LC_MONETARY = "cs_CZ.UTF-8";
      LC_NAME = "cs_CZ.UTF-8";
      LC_NUMERIC = "cs_CZ.UTF-8";
      LC_PAPER = "cs_CZ.UTF-8";
      LC_TELEPHONE = "cs_CZ.UTF-8";
      LC_TIME = "cs_CZ.UTF-8";
    };
  };

  console.keyMap = "cz";

  system.stateVersion = "25.11";
}
