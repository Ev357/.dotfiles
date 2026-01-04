{
  home.file.".config/backgrounds/".source = ./backgrounds;

  services.hyprpaper.settings = {
    splash = false;
    wallpaper = [
      {
        monitor = "";
        path = "~/.config/backgrounds/wall2.png";
      }
    ];
  };
}
