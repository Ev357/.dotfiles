{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.services.gnome-keyring.enable {
    services.gnome-keyring = {
      components = ["secrets" "ssh"];
    };

    home.packages = with pkgs; [
      gcr
    ];
  };
}
