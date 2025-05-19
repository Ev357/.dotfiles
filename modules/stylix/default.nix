{ pkgs, ... }:

{
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    autoEnable = false;
    targets = {
      swaync.enable = true;
      bat.enable = true;
      btop.enable = true;
    };
    fonts = with pkgs; {
      serif = {
        package = geist-font;
        name = "Geist";
      };
      sansSerif = {
        package = geist-font;
        name = "Geist";
      };
      monospace = {
        package = nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font";
      };
      emoji = {
        package = nerd-fonts.geist-mono;
        name = "GeistMono Nerd Font";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}
