{
  lib,
  config,
  pkgs,
  ...
}: {
  config = lib.mkIf config.programs.prismlauncher.enable {
    programs.prismlauncher.settings = {
      ApplicationTheme = "Catppuccin-Macchiato";
      BackgroundCat = "kitteh";
    };

    xdg.dataFile."PrismLauncher/themes/Catppuccin-Macchiato".source = let
      catppuccin-prismlauncher = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "prismlauncher";
        rev = "1ef0e745286ce32750abc3bc5d3ca8073a623b60";
        sha256 = "sha256-RN1VM29OH75GHSHgpu3HW8YSonIEnX7MZzCObJ6BwtQ=";
      };
    in "${catppuccin-prismlauncher}/themes/macchiato/lavender";
  };
}
