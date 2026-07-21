{
  imports = [
    ../../modules
  ];

  home = {
    username = "evest";
    homeDirectory = "/home/evest";
    stateVersion = "26.05";
  };

  modules.shell.enable = true;

  programs.nixvim.configNames = {
    homeManager = "evest@sophie";
    nixos = "sophie";
  };

  dconf.enable = false;
}
