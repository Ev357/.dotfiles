{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.homeModules.stylix
  ];

  home.packages = with pkgs; [
    maple-mono.NF-CN-unhinted
  ];

  stylix = {
    enableReleaseChecks = false;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    autoEnable = false;
    targets = {
      swaync.enable = true;
      bat.enable = true;
      btop.enable = true;
      gtk.enable = true;
    };
    fonts = with pkgs; {
      serif = {
        package = maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
      sansSerif = {
        package = maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
      monospace = {
        package = maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
      emoji = {
        package = maple-mono.NF-CN-unhinted;
        name = "Maple Mono NF CN";
      };
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };

  gtk = {
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
