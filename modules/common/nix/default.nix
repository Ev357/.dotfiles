{ pkgs, ... }:

{
  nix = {
    package = pkgs.nix;
    settings = {
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://ev357.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "ev357.cachix.org-1:bI65rULXWJ8IMM+tosc/Z+9W53nL6uj4+5FLXX6BN3Q="
      ];
    };
  };
}
