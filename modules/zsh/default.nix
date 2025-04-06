{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      "ls" = "eza --icons";
      "la" = "eza -lAh --icons";
      "cat" = "bat";
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
    ];

    profileExtra = /* bash */ ''
      if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
}
