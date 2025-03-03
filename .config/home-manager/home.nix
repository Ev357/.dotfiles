{ pkgs, ... }@inputs:

{
  home.username = "evest";
  home.homeDirectory = "/home/evest";

  home.stateVersion = "24.11";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    fnm
    bat
    git
    nerd-fonts.geist-mono
    yazi
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.dotnet/tools"
    "$HOME/.local/bin"
  ];

  home.file = {
    ".config/electron-flags.conf".source = ./dotfiles/.config/electron-flags.conf;
  };

  programs = {
    home-manager.enable = true;
    nixvim = import ./neovim inputs;
    zsh = import ./zsh inputs;
    starship = import ./starship inputs;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [ "--cmd cd" ];
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

