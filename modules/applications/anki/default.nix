{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.anki.enable {
    programs.anki = {
      videoDriver = "opengl";
      theme = "dark";
      style = "anki";
      minimalistMode = true;
      sync = {
        url = "https://anki.ts.evest.dev/";
        keyFile = "${config.home.homeDirectory}/.config/anki/sync-key";
        autoSync = true;
        syncMedia = true;
        autoSyncMediaMinutes = 15;
        networkTimeout = 60;
      };
      addons = with pkgs.ankiAddons; [
        anki-connect
        passfail2
        review-heatmap
        (recolor.withConfig {
          config = let
            version = builtins.splitVersion recolor.version;
            baseTheme = lib.importJSON "${recolor}/share/anki/addons/recolor/themes/(dark) Catppuccin Macchiato.json";
            bgColor = builtins.elemAt baseTheme.colors.CANVAS 1;
          in
            lib.recursiveUpdate baseTheme {
              version = {
                major = lib.toInt (builtins.elemAt version 0);
                minor = lib.toInt (builtins.elemAt version 1);
              };
              colors = {
                BORDER_SUBTLE = ["Border (subtle)" bgColor bgColor "--border-subtle"];
              };
            };
        })
      ];
    };

    home.sessionVariables = {
      ANKI_WAYLAND = "1";
    };
  };
}
