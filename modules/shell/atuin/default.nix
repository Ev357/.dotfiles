{pkgs, ...}: let
  catppuccin-atuin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "atuin";
    rev = "abfab12de743aa73cf20ac3fa61e450c4d96380c";
    sha256 = "sha256-t/Pq+hlCcdSigtk5uzw3n7p5ey0oH/D5S8GO/0wlpKA=";
  };
in {
  programs.atuin = {
    daemon.enable = true;
    flags = [
      "--disable-up-arrow"
    ];
    settings = {
      sync_frequency = "5m";
      sync_address = "https://atuin.ts.evest.dev";
      theme.name = "catppuccin-macchiato-lavender";
      keymap_mode = "vim-insert";
      keymap_cursor = {
        vim_insert = "steady-bar";
        vim_normal = "steady-block";
      };
    };
    themes = {
      "catppuccin-macchiato-lavender" = builtins.readFile "${catppuccin-atuin}/themes/macchiato/catppuccin-macchiato-lavender.toml";
    };
  };
}
