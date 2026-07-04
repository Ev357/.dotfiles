{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../nixosModules
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
  ];

  boot = {
    # There is a wierd kernel panic https://community.frame.work/t/kernel-panics-on-fedora-42-6-17-7/77856
    kernelPackages = pkgs.linuxPackages_7_0;
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
    games.enable = true;
  };

  nixpkgs.config.rocmSupport = true;

  programs = {
    hyprland.enable = true;
    nix-ld.enable = true;
    virt-manager.enable = true;
    winbox.enable = true;
    localsend = {
      enable = true;
      package = pkgs.emptyDirectory;
    };
  };

  services = {
    fwupd.enable = true;
    openssh.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
    tailscale.enable = true;
    printing.enable = true;
    blueman.enable = true;
    lact.enable = true;
    geoclue2.enable = true;

    xserver = {
      xkb = {
        layout = "cz";
        variant = "qwerty";
      };
      videoDrivers = ["amdgpu"];
    };
    udev.extraHwdb = ''
      evdev:name:FRMW0004:00 32AC:0006 Wireless Radio Control*
        KEYBOARD_KEY_100c6=reserved
    '';
  };

  security.pam.services.login.enableGnomeKeyring = true;

  virtualisation.libvirtd.enable = true;

  hardware = {
    opentabletdriver.enable = true;
    bluetooth.enable = true;
  };

  powerManagement.enable = true;

  location.provider = "geoclue2";

  environment.shells = with pkgs; [
    nushell
  ];

  users.users."evest" = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    shell = pkgs.nushell;
  };

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      wifi.powersave = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
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

  system.stateVersion = "25.05";
}
