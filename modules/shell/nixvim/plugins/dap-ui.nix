{
  plugins.dap-ui.settings = {
    icons = { expanded = "▾"; collapsed = "▸"; current_frame = "*"; };
    controls = {
      icons = {
        pause = "⏸";
        play = "▶";
        step_into = "⏎";
        step_over = "⏭";
        step_out = "⏮";
        step_back = "b";
        run_last = "▶▶";
        terminate = "⏹";
        disconnect = "⏏";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<F7>";
      action.__raw = /*lua*/ ''
        function()
          require('dapui').toggle()
        end
      '';
      options.desc = "Debug: See last session result.";
    }
  ];
}
