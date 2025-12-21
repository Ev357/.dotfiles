{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.xdg.autostart;
  linkedDesktopEntries = pkgs.runCommandLocal "xdg-autostart-entries" {} ''
    mkdir -p $out
    ${lib.concatMapStringsSep "\n" (e: "ln -s ${e} $out") cfg.entries}
  '';
in {
  config = lib.mkIf cfg.enable {
    xdg.configFile.autostart = lib.mkIf cfg.readOnly (lib.mkForce {
      source = linkedDesktopEntries;
      recursive = !cfg.readOnly;
    });
  };
}
