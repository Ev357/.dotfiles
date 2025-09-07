{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.programs.hyprshot.enable {
    programs.hyprshot = {
      package = pkgs.nur.repos.Ev357.hyprshot;
    };

    modules.uwsm.environmentVariables = {
      HYPRSHOT_DIR = "$HOME/Pictures/screenshots";
    };
  };
}
