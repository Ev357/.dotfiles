{ lib, pkgs, ... }:

pkgs.buildNpmPackage rec {
  pname = "cmdr";
  version = "0.5.2";

  src = pkgs.fetchFromGitHub {
    owner = "phibr0";
    repo = "obsidian-commander";
    rev = version;
    sha256 = "sha256-JR7sKwhVKkdBQ0fruAs/cPBNpSrVeSNF01ktu/JPeqg=";
  };

  npmDepsHash = "sha256-E/XxgLFQZaowYwYujdBszbfb2MDonAfZUnMVTo8gN3I=";

  postPatch = /* bash */ ''
    cp ${./package.json} package.json
    cp ${./package-lock.json} package-lock.json
  '';

  installPhase = /* bash */ ''
    mkdir -p $out/
    cp main.js manifest.json styles.css $out/
  '';

  meta = {
    description = "Customize your workspace by adding commands everywhere, create Macros and supercharge your mobile toolbar.";
    homepage = "https://github.com/phibr0/obsidian-commander";
    changelog = "https://github.com/phibr0/obsidian-commander/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [
      ev357
    ];
  };
}
