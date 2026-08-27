{
  programs.zed-editor = {
    userSettings = {
      ui_font_size = 16;
      buffer_font_size = 16;
      theme = {
        mode = "system";
        light = "Catppuccin Macchiato";
        dark = "Catppuccin Macchiato";
      };
      vim_mode = true;
      vim = {
        toggle_relative_line_numbers = true;
      };
      project_panel = {
        dock = "right";
      };
      edit_predictions = {
        provider = "codestral";
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
    };

    extensions = ["catppuccin"];
  };
}
