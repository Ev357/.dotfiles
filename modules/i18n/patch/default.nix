{ lib, config, pkgs, ... }:

let
  cfg = config.i18n.inputMethod;
in
{
  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [
      (final: prev: {
        libsForQt5 = prev.libsForQt5.overrideScope (nfinal: nprev: {
          fcitx5-with-addons = pkgs.callPackage ./fcitx5-with-addons { };
        });
      })
    ];
  };
}
