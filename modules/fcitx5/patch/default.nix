{
  lib,
  config,
  ...
}: let
  cfg = config.i18n.inputMethod;
in {
  config = lib.mkIf cfg.enable {
    nixpkgs.config.packageOverrides = pkgs: {
      catppuccin-fcitx5 = pkgs.catppuccin-fcitx5.overrideAttrs {
        installPhase =
          # bash
          ''
            runHook preInstall

            find src -name theme.conf -exec sed -i 's/^# \(Image=\(panel\|highlight\)\.svg\)/\1/' {} +

            mkdir -p $out/share/fcitx5
            cp -r src $out/share/fcitx5/themes

            runHook postInstall
          '';
      };
    };
  };
}
