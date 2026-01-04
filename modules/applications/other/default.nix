{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: {
  options.modules.applications.other = {
    enable = lib.mkEnableOption "enables other applications";
  };

  config = lib.mkIf config.modules.applications.other.enable {
    home.packages = with pkgs; [
      loupe
      fragments
      inputs.nixpkgs-stable.legacyPackages.${stdenv.hostPlatform.system}.easytag
      session-desktop
      libreoffice-qt6-fresh
      system-config-printer
      gnome-console
      bitwarden-desktop
      dbeaver-bin
      winbox4
      localsend
      nautilus
      gimp3
      # Grayjay is broken now for some reason
      # grayjay
      nur.repos.Ev357.hayase
      nur.repos.Ev357.krita
      anki-bin
      cosmic-files
    ];
  };
}
