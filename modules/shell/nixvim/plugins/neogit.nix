{
  plugins.neogit.settings = {
    kind = "replace";
    disable_context_highlighting = true;
    integrations.diffview = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action.__raw = /*lua*/ ''
        require('neogit').open
      '';
      options.desc = "[G]it [S]tatus";
    }
    {
      mode = "n";
      key = "<leader>gc";
      action.__raw = /*lua*/ ''
        function()
          require('neogit').open { 'commit' }
        end
      '';
      options.desc = "[G]it [C]ommit";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action.__raw = /*lua*/ ''
        function()
          require('neogit').open { 'pull' }
        end
      '';
      options.desc = "[G]it [p]ull";
    }
    {
      mode = "n";
      key = "<leader>gP";
      action.__raw = /*lua*/ ''
        function()
          require('neogit').open { 'push' }
        end
      '';
      options.desc = "[G]it [P]ush";
    }
  ];
}
