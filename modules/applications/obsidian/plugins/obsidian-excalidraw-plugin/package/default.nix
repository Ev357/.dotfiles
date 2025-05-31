{ lib, pkgs, ... }:

pkgs.buildNpmPackage rec {
  pname = "obsidian-excalidraw-plugin";
  version = "2.12.2";

  src = pkgs.fetchFromGitHub {
    owner = "zsviczian";
    repo = "obsidian-excalidraw-plugin";
    rev = version;
    sha256 = "sha256-HiYFFaXxTjhew3ZSYC2HITl2o6c/EKur5Rrsn6UrrQo=";
  };

  npmDepsHash = "sha256-Mukv1eaE/wV/dNOgAyvmn8EAAJubHHdE0BKEQ3ca5Oc=";

  npmBuildScript = "build:all";

  installPhase = /* bash */ ''
    mkdir -p $out/
    cp dist/main.js dist/manifest.json dist/styles.css $out/
  '';

  meta = {
    description = "An Obsidian plugin to edit and view Excalidraw drawings";
    homepage = "https://excalidraw-obsidian.online";
    changelog = "https://github.com/zsviczian/obsidian-excalidraw-plugin/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      ev357
    ];
  };
}
