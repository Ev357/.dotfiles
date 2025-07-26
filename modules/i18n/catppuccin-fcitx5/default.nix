{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
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
}
