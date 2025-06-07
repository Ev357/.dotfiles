{ stdenv, ... }:

stdenv.mkDerivation {
  name = "wooting-udev-rules";

  src = ./.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = /* bash */ ''
    mkdir -p $out/lib/udev/rules.d
    cp 70-wooting.rules $out/lib/udev/rules.d/
  '';
}
