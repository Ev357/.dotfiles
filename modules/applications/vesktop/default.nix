{
  programs.vesktop = {
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
}
