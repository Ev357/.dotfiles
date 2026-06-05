{
  programs.zellij = {
    layouts = {
      zen = {
        layout.pane = {};
        pane_frames = false;
      };
    };
    settings = {
      theme = "catppuccin-macchiato";
      default_layout = "zen";
      simplified_ui = true;
      show_release_notes = false;
      show_startup_tips = false;
    };
  };
}
