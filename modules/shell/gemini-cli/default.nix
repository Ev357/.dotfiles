{
  programs.gemini-cli.settings = {
    general = {
      preferredEditor = "nvim";
      vimMode = true;
      disableAutoUpdate = true;
      disableUpdateNag = true;
    };
    security = {
      auth = {
        selectedType = "oauth-personal";
      };
    };
  };
}
