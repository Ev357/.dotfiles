{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
    ../../nixosModules
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 2;
      };
      efi.canTouchEfiVariables = true;
    };
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  modules = {
    packages.enable = true;
    fonts.enable = true;
  };

  programs = {
    hyprland.enable = true;
    zsh.enable = true;
    nix-ld.enable = true;
  };

  services = {
    fwupd.enable = true;
    openssh.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tailscale.enable = true;
    gnome.evolution-data-server.enable = true;

    xserver.xkb.layout = "cz";
  };

  security.pam.services.login.enableGnomeKeyring = true;

  hardware.opentabletdriver.enable = true;

  users.users.evest = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
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

  system.stateVersion = "25.05";
}
