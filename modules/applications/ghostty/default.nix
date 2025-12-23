{
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.ghostty = {
    package = lib.mkDefault inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      theme = "Catppuccin Macchiato";
      gtk-titlebar = false;
      background-opacity = 0.95;
      font-family = "Maple Mono NF CN";
      font-size = 14;
      window-show-tab-bar = "never";
      window-theme = "ghostty";
      mouse-hide-while-typing = true;
      confirm-close-surface = false;
      window-new-tab-position = "end";
      focus-follows-mouse = true;
      copy-on-select = "clipboard";
      quit-after-last-window-closed = true;
      quit-after-last-window-closed-delay = "5m";

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

        "alt+v=activate_key_table:vim"

        "vim/"

        "vim/j=scroll_page_lines:1"
        "vim/k=scroll_page_lines:-1"

        "vim/ctrl+d=scroll_page_down"
        "vim/ctrl+u=scroll_page_up"
        "vim/ctrl+f=scroll_page_down"
        "vim/ctrl+b=scroll_page_up"
        "vim/shift+j=scroll_page_down"
        "vim/shift+k=scroll_page_up"

        "vim/g>g=scroll_to_top"
        "vim/shift+g=scroll_to_bottom"

        "vim/slash=start_search"
        "vim/n=navigate_search:next"

        "vim/v=copy_to_clipboard"
        "vim/y=copy_to_clipboard"

        "vim/shift+semicolon=toggle_command_palette"

        "vim/escape=deactivate_key_table"
        "vim/q=deactivate_key_table"
        "vim/i=deactivate_key_table"

        "vim/catch_all=ignore"
      ];
    };
  };
}
