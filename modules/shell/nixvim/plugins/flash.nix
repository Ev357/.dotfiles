{
  programs.nixvim = {
    plugins.flash.settings = {
      modes.char.enabled = false;
    };

    keymaps = [
      {
        mode = [ "n" "x" "o" ];
        key = "s";
        action.__raw = /*lua*/ ''
          require("flash").jump
        '';
        options.desc = "Flash";
      }
      {
        mode = [ "n" "x" "o" ];
        key = "S";
        action.__raw = /*lua*/ ''
          require("flash").treesitter
        '';
        options.desc = "Flash Treesitter";
      }
      {
        mode = "o";
        key = "r";
        action.__raw = /*lua*/ ''
          require("flash").remote
        '';
        options.desc = "Remote Flash";
      }
      {
        mode = [ "o" "x" ];
        key = "R";
        action.__raw = /*lua*/ ''
          require("flash").treesitter_search
        '';
        options.desc = "Treesitter Search";
      }
      {
        mode = "c";
        key = "<c-s>";
        action.__raw = /*lua*/ ''
          require("flash").toggle
        '';
        options.desc = "Toggle Flash Search";
      }
    ];
  };
}
