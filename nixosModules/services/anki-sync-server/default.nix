{
  imports = [
    ./patch
  ];

  services.anki-sync-server = {
    address = "0.0.0.0";
    openFirewall = true;
  };
}
