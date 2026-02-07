{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.yazi.enable {
    programs.yazi = {
      enableNushellIntegration = true;
      keymap = {
        mgr.prepend_keymap = [
          {
            on = ["g" "c"];
            run = ["cd ~/.config" "hidden show"];
            desc = "Goto ~/.config";
          }
          {
            on = ["g" "w"];
            run = "cd ~/work";
            desc = "Goto ~/work";
          }
          {
            on = ["c" "a"];
            run = "plugin compress";
            desc = "Archive selected files";
          }
        ];
      };
      theme = {
        flavor = {
          dark = "catppuccin-macchiato";
          light = "catppuccin-macchiato";
        };
      };
      plugins = {
        compress = pkgs.yaziPlugins.compress;
      };
      flavors = let
        yazi-flavors = pkgs.fetchFromGitHub {
          owner = "yazi-rs";
          repo = "flavors";
          rev = "9e053d0686a7d54a125d67bdd3aabaa5116d6e99";
          sha256 = "sha256-B9b6T9/RkJDkehMC5/MxqnkjxWj5LZg4jehAn6aeamE=";
        };
      in {
        catppuccin-macchiato = "${yazi-flavors}/catppuccin-macchiato.yazi/";
      };
    };

    home.packages = with pkgs; [
      zip
    ];
  };
}
