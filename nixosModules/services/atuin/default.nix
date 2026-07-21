{
  imports = [
    ./patch
  ];

  services.atuin = {
    openFirewall = true;
  };
}
