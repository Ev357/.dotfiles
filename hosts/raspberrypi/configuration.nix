{
  nixos-raspberrypi,
  config,
  pkgs,
  ...
}: {
  imports = [
    nixos-raspberrypi.nixosModules.raspberry-pi-5.base
    nixos-raspberrypi.nixosModules.sd-image
    ./nixosModules
    ../../nixosModules
  ];

  modules = {
    packages.enable = true;
  };

  services = {
    openssh.enable = true;
    cloudflared.enable = true;
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
    seerr.enable = true;
    radarr.enable = true;
    sonarr.enable = true;
    prowlarr.enable = true;
    bazarr.enable = true;
    flaresolverr.enable = true;
    qbittorrent.enable = true;
    cloudflare-warp.enable = true;
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
