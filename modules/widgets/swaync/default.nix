{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.services.swaync.enable {
    home.packages = with pkgs; [
      libnotify
    ];
  };
}
