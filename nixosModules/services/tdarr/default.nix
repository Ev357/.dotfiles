{
  imports = [
    ./patch
  ];

  services.tdarr = {
    server = {
      enable = true;
      openFirewall = true;
      auth.enable = true;
    };
  };
}
