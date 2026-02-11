{
  pkgs,
  inputs,
  ...
}: {
  services.qbittorrent = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.qbittorrent-nox;
    webuiPort = 8087;
    openFirewall = true;
    group = "media";
  };
}
