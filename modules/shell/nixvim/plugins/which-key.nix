{
  plugins.which-key.settings = {
    spec = [
      {
        __unkeyed = "<leader>c";
        group = "[C]ode";
        mode = [ "n" "x" ];
      }
      {
        __unkeyed = "<leader>r";
        group = "[R]ename";
      }
      {
        __unkeyed = "<leader>s";
        group = "[S]earch";
      }
      {
        __unkeyed = "<leader>g";
        group = "[G]it";
      }
      {
        __unkeyed = "<leader>h";
        group = "Git [H]unk";
        mode = [ "n" "v" ];
      }
    ];
  };
}
