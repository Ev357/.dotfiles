{ pkgs, lib, config, ... }:

{
  programs.zsh = {
    syntaxHighlighting.enable = true;

    shellAliases = {
      "ls" = "eza --icons";
      "la" = "eza -lAhg --icons";
      "date" = "date +\"%F %T\"";
    };

    history = {
      size = 4000;
      path = "$HOME/.zsh_history";
      append = true;
      saveNoDups = true;
      findNoDups = true;
    };

    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    initContent = lib.mkOrder 1500 /* bash */ ''
      function zvm_after_init() {
        bindkey '^R' fzf-history-widget
      }
    '';

    profileExtra = lib.mkIf config.wayland.windowManager.hyprland.enable /* bash */ ''
      if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}
