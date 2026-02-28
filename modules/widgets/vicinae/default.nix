{
  programs.vicinae = {
    settings = {
      theme = {
        dark.name = "catppuccin-macchiato";
        light.name = "catppuccin-macchiato";
      };
    };
    systemd.enable = true;
    # extensions = with pkgs; [
    #   nur.repos.Ev357.bitwarden
    # ];
  };
}
