{ pkgs, ... }:

{
  imports = [
    ../../modules
  ];

  home = {
    packages = with pkgs; [
      nerd-fonts.geist-mono
      hyprshot
      libnotify
      nautilus
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
}
