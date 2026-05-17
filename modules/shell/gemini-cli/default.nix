{
  programs.gemini-cli.settings = {
    general = {
      preferredEditor = "nvim";
      vimMode = true;
      enableAutoUpdate = false;
      enableAutoUpdateNotification = false;
    };
    ui = {
      hideBanner = true;
      hideFooter = true;
      hideTips = true;
      useFullWidth = true;
    };
    security = {
      auth = {
        selectedType = "oauth-personal";
      };
    };
  };
}
