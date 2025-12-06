{
  pkgs,
  inputs,
  ...
}: {
  services.hyprlauncher = {
    package = inputs.hyprlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      ui.window_size = "600 360";
      finders.desktop_launch_prefix = "uwsm app -- ";
    };
  };
}
