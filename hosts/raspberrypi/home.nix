{
  imports = [
    ../../modules
  ];

  home = {
    username = "evest";
    homeDirectory = "/home/evest";
    stateVersion = "25.05";
  };

  modules.shell.enable = true;

  programs.nixvim.configNames = {
    homeManager = "evest@raspberrypi";
    nixos = "raspberrypi";
  };

  dconf.enable = false;
}
