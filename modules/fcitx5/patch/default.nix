{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.i18n.inputMethod;
in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (final: prev: {
        libsForQt5 = prev.libsForQt5.overrideScope (
          nfinal: nprev: {
            fcitx5-with-addons = pkgs.callPackage ./fcitx5-with-addons { };
          }
        );

        catppuccin-fcitx5 = prev.catppuccin-fcitx5.overrideAttrs {
          installPhase = # bash
            ''
              runHook preInstall

              find src -name theme.conf -exec sed -i 's/^# \(Image=\(panel\|highlight\)\.svg\)/\1/' {} +

              mkdir -p $out/share/fcitx5
              cp -r src $out/share/fcitx5/themes

              runHook postInstall
            '';
        };
      })
    ];
  };
}
