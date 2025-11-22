{config, ...}: {
  imports = [
    ./patch
  ];

  programs.nh = {
    flake = "${config.home.homeDirectory}/.config/home-manager";
  };
}
