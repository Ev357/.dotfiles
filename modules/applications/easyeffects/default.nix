{
  config,
  lib,
  ...
}: {
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.easyeffects.enable {
    services.easyeffects = {
      autostart = false;
    };
  };
}
