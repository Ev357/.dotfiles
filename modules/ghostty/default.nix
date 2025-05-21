{ lib, ... }:

{
  programs.ghostty = {
    enable = lib.mkDefault true;
    settings = {
      theme = "catppuccin-macchiato";
      gtk-titlebar = false;
      background-opacity = 0.975;
      font-family = "GeistMono NF Medium";
      font-family-bold = "GeistMono NF SemiBold";
      font-family-italic = "GeistMono NF Light";
      font-size = 12;
      gtk-tabs-location = "hidden";
      window-theme = "ghostty";
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
      window-new-tab-position = "end";
      focus-follows-mouse = true;
      copy-on-select = "clipboard";
      app-notifications = "no-clipboard-copy";

      keybind = [
        "ctrl+alt+h=goto_split:left"
        "ctrl+alt+j=goto_split:bottom"
        "ctrl+alt+k=goto_split:top"
        "ctrl+alt+l=goto_split:right"

        "super+ctrl+shift+h=resize_split:left,10"
        "super+ctrl+shift+j=resize_split:down,10"
        "super+ctrl+shift+k=resize_split:up,10"
        "super+ctrl+shift+l=resize_split:right,10"

        "alt+plus=goto_tab:1"
        "alt+ě=goto_tab:2"
        "alt+š=goto_tab:3"
        "alt+č=goto_tab:4"
        "alt+ř=goto_tab:5"
        "alt+ž=goto_tab:6"
        "alt+ý=goto_tab:7"
        "alt+á=goto_tab:8"

        "alt+o=toggle_tab_overview"
        "global:alt+q=toggle_quick_terminal"

        "\"ctrl+shift+h=write_screen_file:paste\""
        "\"ctrl+shift+j=text:\\x1b0i nvim +\\\"normal G\\\" \\n\""
      ];
    };
  };
}
