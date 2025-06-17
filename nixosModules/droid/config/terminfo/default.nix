{ lib, pkgs, ... }:

{
  options.environment.enableAllTerminfo = lib.mkOption {
    default = false;
    type = lib.types.bool;
    description = ''
      Whether to install all terminfo outputs
    '';
  };

  config = {
    environment.systemPackages = lib.mkIf config.environment.enableAllTerminfo (
      map (x: x.terminfo) (
        with pkgs.pkgsBuildBuild;
        [
          alacritty
          contour
          foot
          ghostty
          kitty
          mtm
          rio
          rxvt-unicode-unwrapped
          rxvt-unicode-unwrapped-emoji
          st
          termite
          tmux
          wezterm
          yaft
        ]
      )
    );
  };
}
