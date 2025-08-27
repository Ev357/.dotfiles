{pkgs, ...}: {
  programs.obsidian.defaultSettings.themes = [
    {
      pkg = pkgs.nur.repos.Ev357.catppuccin-obsidian;
    }
  ];
}
