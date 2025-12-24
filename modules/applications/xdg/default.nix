{
  imports = [
    ./patch
  ];

  xdg = {
    mimeApps.defaultApplications = {
      "application/pdf" = "zen-twilight.desktop";
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler/https" = "zen-twilight.desktop";
      "x-scheme-handler/chrome" = "zen-twilight.desktop";
      "text/html" = "zen-twilight.desktop";
      "application/x-extension-htm" = "zen-twilight.desktop";
      "application/x-extension-html" = "zen-twilight.desktop";
      "application/x-extension-shtml" = "zen-twilight.desktop";
      "application/xhtml+xml" = "zen-twilight.desktop";
      "application/x-extension-xhtml" = "zen-twilight.desktop";
      "application/x-extension-xht" = "zen-twilight.desktop";
      "x-scheme-handler/discord" = "vesktop.desktop";
      "x-scheme-handler/wootwoot" = "wootility.desktop";
      "x-scheme-handler/web+wootwoot" = "wootility.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "x-scheme-handler/hayase" = "hayase.desktop";
    };
    autostart.readOnly = true;
  };
}
