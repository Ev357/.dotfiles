{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.i18n.inputMethod.enable {
    i18n.inputMethod = {
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-mozc
          fcitx5-gtk
        ];
        waylandFrontend = true;
        settings = import ./settings.nix;
      };
    };

    home = {
      file.".local/share/fcitx5/themes".source = let
        catppuccin-fcitx5 = pkgs.catppuccin-fcitx5.override {
          withRoundedCorners = true;
        };
      in "${catppuccin-fcitx5}/share/fcitx5/themes";

      sessionVariables = {
        XMODIFIERS = "@im=fcitx";
        QT_IM_MODULE = "fcitx";
        GTK_IM_MODULE = "wayland";
        QT_IM_MODULES = "wayland;fcitx;ibus";
        SDL_IM_MODULE = "fcitx";
      };
    };

    gtk = {
      gtk2.extraConfig =
        # ini
        ''
          gtk-im-module="fcitx"
        '';
      gtk3.extraConfig = {
        gtk-im-module = "fcitx";
      };
      gtk4.extraConfig = {
        gtk-im-module = "fcitx";
      };
    };
  };
}
