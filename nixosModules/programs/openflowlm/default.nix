{inputs, ...}: {
  imports = [
    ({
      config,
      lib,
      pkgs,
      ...
    }:
      (import "${inputs.openflowlm}/nix/nixos-module.nix") {
        inherit config lib pkgs;
        self = inputs.openflowlm;
      })
  ];

  nixpkgs.overlays = [
    inputs.openflowlm.overlays.default
  ];
}
