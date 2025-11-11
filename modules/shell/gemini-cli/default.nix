{
  programs.gemini-cli.settings = {
    general = {
      preferredEditor = "nvim";
      vimMode = true;
      disableAutoUpdate = true;
      disableUpdateNag = true;
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
