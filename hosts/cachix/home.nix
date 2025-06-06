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
    ags.enable = true;
  };

  services.cachix-agent.enable = true;
}
