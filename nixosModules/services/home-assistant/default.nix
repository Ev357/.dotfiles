{
  services.home-assistant = {
    openFirewall = true;
    extraComponents = [
      "analytics"
      "google_translate"
      "met"
      "radio_browser"
      "shopping_list"
      "isal"
    ];
    config = {
      http = {
        use_x_forwarded_for = true;
        trusted_proxies = ["::1" "127.0.0.1"];
      };
      default_config = {};
    };
  };
}
