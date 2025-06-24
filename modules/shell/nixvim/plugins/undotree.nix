{
  plugins.undotree = {
    settings = {
      SetFocusWhenToggle = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>u";
      action.__raw = /*lua*/ ''
        vim.cmd.UndotreeToggle
      '';
      options.desc = "[U]ndo tree";
    }
  ];
}
