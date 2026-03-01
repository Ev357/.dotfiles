{pkgs, ...}: {
  programs.vicinae = {
    settings = {
      theme = {
        dark.name = "catppuccin-macchiato";
        light.name = "catppuccin-macchiato";
      };
      providers = {
        "@jomifepe/${pkgs.nur.repos.Ev357.raycast-bitwarden.name}" = {
          preferences = {
            cliPath = "${pkgs.bitwarden-cli}/bin/bw";
            serverUrl = "https://vaultwarden.ts.evest.dev";
          };
        };
      };
    };
    systemd.enable = true;
    extensions = with pkgs; [
      nur.repos.Ev357.raycast-bitwarden
    ];
  };
}
