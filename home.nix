{ pkgs, ... }:

{
  imports = [
    ./modules
  ];

  home = {
    username = "evest";
    homeDirectory = "/home/evest";

    stateVersion = "24.11";

    packages = with pkgs; [
      nerd-fonts.geist-mono
      hyprshot
      libnotify
      nautilus
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    file = {
      ".config/hypr/hyprland/colors.conf".source = ./dotfiles/.config/hypr/hyprland/colors.conf;
      ".config/electron-flags.conf".source = ./dotfiles/.config/electron-flags.conf;
      ".config/starship.toml".source = ./dotfiles/.config/starship.toml;
      ".config/backgrounds/".source = ./dotfiles/.config/backgrounds;
      ".config/OpenTabletDriver/Presets/".source = ./dotfiles/.config/OpenTabletDriver/Presets;
      ".config/mpv/mpv.conf".source = ./dotfiles/.config/mpv/mpv.conf;
      ".icons/hypr_Bibata-Modern-Classic/".source = builtins.fetchTarball {
        url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Classic.tar.gz";
        sha256 = "08q5l2sywc0s70zdn7jvr0rbzz0w8j18wmlkf2x1l64y93lbvzsj";
      };
      ".face.icon".source = ./dotfiles/.face.icon;
    };
  };

  programs.home-manager.enable = true;
}
