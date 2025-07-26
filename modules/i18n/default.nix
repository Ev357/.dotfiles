{ pkgs, lib, config, ... }:

let
  catppuccin-fcitx5 = pkgs.stdenv.mkDerivation {
    name = "catppuccin-fcitx5-rounded";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "fcitx5";
      rev = "393845cf3ed0e0000bfe57fe1b9ad75748e2547f";
      sha256 = "sha256-ss0kW+ulvMhxeZKBrjQ7E5Cya+02eJrGsE4OLEkqKks=";
    };

    buildPhase = /* bash */ ''
      bash enable-rounded.sh
    '';

    installPhase = /* bash */ ''
      mkdir -p $out
      cp -r src/* $out/
    '';
  };
in
{
  config = lib.mkIf config.i18n.inputMethod.enable
    {
      i18n.inputMethod = {
        type = "fcitx5";
        fcitx5 = {
          addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
          ];
          waylandFrontend = true;
          settings = import ./settings.nix;
        };
      };

      home.file.".local/share/fcitx5/themes".source = catppuccin-fcitx5;
    };
}
