{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  config = lib.mkIf config.programs.vesktop.enable {
    programs.vesktop = {
      package = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.vesktop;
      settings = {
        discordBranch = "canary";
        minimizeToTray = false;
        arRPC = true;
        splashColor = "rgb(239, 239, 240)";
        splashBackground = "rgb(32, 32, 36)";
      };
      vencord = {
        themes = {
          macchiato = ./macchiato.theme.css;
        };
        settings = {
          enabledThemes = ["macchiato.css"];
        };
      };
    };

    xdg.configFile."vesktop/userAssets/splash".source = ./shiggy.gif;
  };
}
