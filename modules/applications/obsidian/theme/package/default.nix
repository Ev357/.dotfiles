{ lib, pkgs, ... }:

pkgs.buildNpmPackage rec {
  pname = "catppuccin-obsidian";
  version = "2.0.3";

  src = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "obsidian";
    rev = "main";
    sha256 = "sha256-bjjOUVftKMImqZe8qr6K7KIFGFadWhWT/6lWFLDUQL4=";
  };

  npmDepsHash = "sha256-Tj5zgt2DxKmNCKPPLqfCylKGtHuofU3GJNaRjQWe5FE=";

  installPhase = /* bash */ ''
    mkdir -p $out/
    cp manifest.json $out/
    cp dist/catppuccin.css $out/theme.css
  '';

  meta = {
    description = "Catppuccin for Obsidian";
    homepage = "https://github.com/catppuccin/obsidian";
    changelog = "https://github.com/catppuccin/obsidian/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      ev357
    ];
  };
}
