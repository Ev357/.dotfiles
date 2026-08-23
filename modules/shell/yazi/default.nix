{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.yazi.enable {
    programs.yazi = {
      shellWrapperName = "y";
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
          rev = "be0b21d0873092a63946cc2678dd700aac945902";
          sha256 = "sha256-Dy73TfcrcbCXY9lwDszNgAKLiCAHf1KIwC4Q5U6k21E=";
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
