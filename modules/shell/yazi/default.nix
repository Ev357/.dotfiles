{ pkgs, ... }:

{
  imports = [
    ./theme.nix
  ];

  programs.yazi = {
    enableZshIntegration = true;
    keymap = {
      manager.prepend_keymap = [
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
    plugins = {
      compress = pkgs.fetchFromGitHub {
        owner = "Ev357";
        repo = "compress.yazi";
        rev = "main";
        sha256 = "0xpasrxs6dv19k8j0vdga4g3a3bwkcc51aldnp1rfsdcw88ghr8c";
      };
    };
  };
}
