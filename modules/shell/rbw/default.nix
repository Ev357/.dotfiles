{pkgs, ...}: {
  programs.rbw.settings = {
    email = "evest.dev@gmail.com";
    base_url = "https://vaultwarden.ts.evest.dev";
    pinentry = pkgs.pinentry-gnome3;
  };
}
