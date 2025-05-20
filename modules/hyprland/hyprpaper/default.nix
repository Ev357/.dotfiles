{
  home.file.".config/backgrounds/".source = ./backgrounds;

  services.hyprpaper = {
    settings = {
      preload = "~/.config/backgrounds/wall2.png";
      wallpaper = ", ~/.config/backgrounds/wall2.png";
    };
  };
}
