{pkgs, ...}: {
  services.gnome.evolution-data-server.plugins = with pkgs; [
    evolution-ews
  ];
}
