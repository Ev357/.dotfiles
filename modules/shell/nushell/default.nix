{
  lib,
  config,
  pkgs,
  ...
}: let
  catppuccin-nushell = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "nushell";
    rev = "05987d258cb765a881ee1f2f2b65276c8b379658";
    sha256 = "sha256-tQ3Br6PaLBUNIXY56nDjPkthzvgEsNzOp2gHDkZVQo0=";
  };
in {
  config = lib.mkIf config.programs.nushell.enable {
    programs.nushell = {
      settings = {
        show_banner = false;
        edit_mode = "vi";
        cursor_shape = {
          vi_insert = "line";
          vi_normal = "block";
        };
      };

      shellAliases = {
        "la" = "ls -a";
        "tree" = "ls **/*";
      };

      environmentVariables = {
        PROMPT_INDICATOR_VI_INSERT = "";
        PROMPT_INDICATOR_VI_NORMAL = "";
      };

      extraConfig =
        # nu
        ''
          source ~/.config/nushell/catppuccin_macchiato.nu
        '';

      extraLogin =
        lib.mkIf config.wayland.windowManager.hyprland.enable
        # nu
        ''
          if (uwsm check may-start | complete | get exit_code) == 0 {
              uwsm start hyprland-uwsm.desktop
              exit
          }
        '';
    };

    xdg.configFile."nushell/catppuccin_macchiato.nu".source = "${catppuccin-nushell}/themes/catppuccin_macchiato.nu";
  };
}
