{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.ghostty.enable {
    xdg.configFile."systemd/user/app-com.mitchellh.ghostty.service.d/type.conf".text = ''
      [Service]
      Type=dbus
    '';
  };
}
