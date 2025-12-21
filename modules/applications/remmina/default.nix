{
  config,
  lib,
  ...
}: {
  imports = [
    ./patch
  ];

  config = lib.mkIf config.services.remmina.enable {
    services.remmina = {
      autostart = false;
    };
  };
}
