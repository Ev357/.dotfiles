{
  imports = [
    ./patch
  ];

  services.traefik = {
    openFirewall = true;
  };
}
