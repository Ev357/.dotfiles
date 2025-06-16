{ pkgs, lib, config, ... }:

{
  imports = [
    ./theme.nix
  ];

  config = lib.mkIf config.programs.yazi.enable {
    programs.yazi = {
      enableZshIntegration = true;
      keymap = {
        mgr.prepend_keymap = [
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
          owner = "KKV9";
          repo = "compress.yazi";
          rev = "0.5";
          sha256 = "sha256-/A2pGc0PtKYXjRWBpbZ7uSoux1+q7mNYOaKjW5viuts=";
        };
      };
    };

    home.packages = with pkgs; [
      zip
    ];
  };
}
