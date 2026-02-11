{
  nixos-raspberrypi,
  config,
  pkgs,
  ...
}: {
  imports = [
    nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    nixos-raspberrypi.nixosModules.sd-image
    ../../nixosModules
  ];

  modules = {
    packages.enable = true;
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";

        Macs = [
          "hmac-sha2-512-etm@openssh.com"
          "hmac-sha2-256-etm@openssh.com"
          "umac-128-etm@openssh.com"
          "hmac-sha2-512"
        ];
      };
    };
    cloudflared = {
      enable = true;
      tunnels = {
        "00c6b9cc-fe15-4b75-aee9-a3ac9411bf9e" = {
          credentialsFile = "/etc/cloudflared/00c6b9cc-fe15-4b75-aee9-a3ac9411bf9e.json";
          default = "http_status:404";
        };
      };
    };
    jellyfin.enable = true;
    nextcloud.enable = true;
    vaultwarden.enable = true;
    anki-sync-server.enable = true;
    anki-api.enable = true;
    traefik.enable = true;
    home-assistant.enable = true;
    tailscale.enable = true;
    forgejo.enable = true;
    atuin.enable = true;
    immich.enable = true;
    jellyseerr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
    prowlarr.enable = true;
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
    hostName = "raspberrypi";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Prague";

  environment.enableAllTerminfo = true;

  fileSystems."/data" = {
    device = "/dev/nvme0n1";
    fsType = "btrfs";
    options = ["compress=zstd" "noatime"];
  };

  system.nixos.tags = let
    cfg = config.boot.loader.raspberry-pi;
  in [
    "raspberry-pi-${cfg.variant}"
    cfg.bootloader
    config.boot.kernelPackages.kernel.version
  ];

  system.stateVersion = config.system.nixos.release;
}
