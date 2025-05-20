{
  home.file.".config/backgrounds/".source = ./backgrounds;

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "~/.config/backgrounds/wall2.png";
      wallpaper = ", ~/.config/backgrounds/wall2.png";
    };
  };
}
