{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  home = {
    username = "evest";
    homeDirectory = "/home/evest";
    stateVersion = "24.11";
  };

  programs = {
    obsidian = {
      enable = true;
      package = pkgs.emptyDirectory;
    };
  };

  services.cachix-agent.enable = true;
}
