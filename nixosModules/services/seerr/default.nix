{
  imports = [
    ./patch
  ];

  services.seerr = {
    configDir = "/var/lib/seerr/";
    openFirewall = true;
  };
}
