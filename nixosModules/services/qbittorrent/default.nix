{
  pkgs,
  inputs,
  ...
}: {
  services.qbittorrent = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.qbittorrent-nox;
    webuiPort = 8087;
    torrentingPort = 51820;
    openFirewall = true;
    group = "media";
    profileDir = "/data/services/qbittorrent";
  };
}
