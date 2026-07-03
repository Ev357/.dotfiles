{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./patch
  ];

  services.minidlna = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.minidlna;
    openFirewall = true;
    settings = {
      inotify = "yes";
      media_dir = [
        "V,/data/movies"
        "V,/data/services/qbittorrent/qBittorrent/downloads"
      ];
    };
  };
}
