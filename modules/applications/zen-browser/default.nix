{inputs, ...}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    setAsDefaultBrowser = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };
}
