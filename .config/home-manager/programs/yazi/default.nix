{ pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  keymap = {
    manager.prepend_keymap =
      [
        {
          on = [ "g" "c" ];
          run = [ "cd ~/.config" "hidden show" ];
          desc = "Goto ~/.config";
        }
        {
          on = [ "g" "w" ];
          run = "cd ~/work";
          desc = "Goto ~/work";
        }
        {
          on = [ "c" "a" ];
          run = "plugin compress";
          desc = "Archive selected files";
        }
      ];
  };
  theme = import ./theme.nix;
  plugins = {
    compress = pkgs.fetchFromGitHub {
      owner = "KKV9";
      repo = "compress.yazi";
      rev = "main";
      sha256 = "0cdb8m38n3i356lmq6i7jldx446w98m1bz59650w5s9dgzf53zk1";
    };
  };
}
