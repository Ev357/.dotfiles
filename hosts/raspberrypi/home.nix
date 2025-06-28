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

  dconf.enable = false;
}
