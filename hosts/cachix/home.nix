{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  programs = {
    obsidian = {
      enable = true;
      package = pkgs.emptyDirectory;
    };
  };

  services.cachix-agent.enable = true;
}
