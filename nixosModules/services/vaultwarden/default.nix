{
  imports = [
    ./patch
  ];

  services.vaultwarden = {
    openFirewall = true;
  };
}
