{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };
}
