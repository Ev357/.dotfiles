{ pkgs, ... }:

{
  home.username = "evest";
  home.homeDirectory = "/home/evest";

  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    starship
    fnm
    zoxide
    fzf
    bat
    eza
    yazi
    git
    nerd-fonts.geist-mono
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    home-manager.enable = true;
    nixvim = import ./nvim { inherit pkgs; };
  };
}
