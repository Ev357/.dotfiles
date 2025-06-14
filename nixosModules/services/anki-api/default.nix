{ pkgs, config, lib, ... }:

{
  options.services.anki-api = {
    enable = lib.mkEnableOption "enables anki-api";
  };

  config = lib.mkIf config.services.anki-api.enable {
    systemd.services.anki-api = {
      description = "anki-api";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.bun}/bin/bun /var/lib/anki-api/.output/server/index.mjs";
        Restart = "always";
        User = "anki";
        Group = "media";
        PrivateTmp = true;
      };
    };

    users.users."anki" = {
      isSystemUser = true;
      group = "media";
    };

    networking.firewall.allowedTCPPorts = [ 3000 ];
  };
}
