{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./nixosModules
    ../../nixosModules
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = with pkgs; [
      nur.repos.Ev357.alx-wol
    ];
    extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 4;
      };
      efi.canTouchEfiVariables = true;
    };
    binfmt.emulatedSystems = ["aarch64-linux"];
  };

  modules = {
    packages.enable = true;
  };

  services = {
    openssh.enable = true;
    fwupd.enable = true;
    tailscale.enable = true;
    immich.enable = true;
    traefik.enable = true;
    nextcloud.enable = true;
    jellyfin.enable = true;
    qbittorrent.enable = true;
    sonarr.enable = true;
    radarr.enable = true;
    prowlarr.enable = true;
    seerr.enable = true;
    tdarr.enable = true;
  };

  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };

  systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];

  hardware.graphics.enable = true;

  environment.shells = with pkgs; [
    nushell
  ];

  users = {
    users = {
      "evest" = {
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager" "media" "libvirtd"];
        shell = pkgs.nushell;
        initialPassword = "12345678";
      };
      "hass-wol" = {
        isSystemUser = true;
        group = "hass-wol";
        createHome = true;
        home = "/home/hass-wol";
        useDefaultShell = true;
      };
    };
    groups = {
      media = {};
      hass-wol = {};
    };
  };

  security.sudo.extraRules = [
    {
      users = ["hass-wol"];
      commands = [
        {
          command = "/run/current-system/sw/bin/poweroff";
          options = ["NOPASSWD"];
        }
      ];
    }
  ];

  networking = {
    hostName = "sophie";
    networkmanager.enable = true;
    interfaces.enp2s0.wakeOnLan.enable = true;
  };

  time.timeZone = "Europe/Prague";

  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "cz";

  environment.enableAllTerminfo = true;

  system.stateVersion = "26.05";
}
