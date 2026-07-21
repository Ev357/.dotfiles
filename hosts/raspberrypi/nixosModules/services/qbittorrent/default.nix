{
  pkgs,
  inputs,
  ...
}: {
  services.qbittorrent = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.qbittorrent-nox;
    group = "media";
    profileDir = "/data/services/qbittorrent";
  };
}
