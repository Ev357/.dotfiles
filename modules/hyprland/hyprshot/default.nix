{pkgs, ...}: {
  programs.hyprshot = {
    package = pkgs.nur.repos.Ev357.hyprshot;
    saveLocation = "$HOME/Pictures/screenshots";
  };
}
