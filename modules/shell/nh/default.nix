{config, ...}: {
  programs.nh = {
    flake = "${config.home.homeDirectory}/.config/home-manager";

    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 14d";
    };
  };
}
