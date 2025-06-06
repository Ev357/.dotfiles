{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-substituters = [
        "https://ev357.cachix.org"
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
      ];
      extra-trusted-public-keys = [
        "ev357.cachix.org-1:bI65rULXWJ8IMM+tosc/Z+9W53nL6uj4+5FLXX6BN3Q="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };
}
