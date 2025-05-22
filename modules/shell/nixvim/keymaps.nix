{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to the left window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to the lower window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to the upper window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to the right window";
    }

    {
      mode = "v";
      key = "<C-k>";
      action = ":m '<-2<CR>gv";
      options.desc = "Move line up";
    }
    {
      mode = "v";
      key = "<C-j>";
      action = ":m '>+1<CR>gv";
      options.desc = "Move line down";
    }

    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>noh<CR>";
    }

    {
      mode = [ "n" "v" ];
      key = "<S-Up>";
      action = "k";
    }
    {
      mode = [ "n" "v" ];
      key = "<S-Down>";
      action = "j";
    }
  ];
}
