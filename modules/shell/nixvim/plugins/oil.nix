{
  plugins.oil.settings = {
    default_file_explorer = true;
    skip_confirm_for_simple_edits = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "-";
      action.__raw =
        # lua
        ''
          require('oil').open
        '';
      options.desc = "Open parent directory";
    }
  ];
}
