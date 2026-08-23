{config, ...}: {
  imports = [
    ./patch
  ];

  services.tdarr = {
    server = {
      enable = config.services.tdarr.enable;
      openFirewall = true;
      auth.enable = true;
    };
  };
}
