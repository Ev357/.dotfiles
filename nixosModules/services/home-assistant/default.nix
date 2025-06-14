{ config, lib, ... }:

{
  config = lib.mkIf config.services.home-assistant.enable {
    services.home-assistant = {
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
          trusted_proxies = [ "::1" "127.0.0.1" ];
        };
        default_config = { };
      };
    };

    networking.firewall.allowedTCPPorts = [
      config.services.home-assistant.config.http.server_port
    ];
  };
}
