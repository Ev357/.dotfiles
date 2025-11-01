{
  lib,
  withConfigtool ? true,
  addons ? [],
  pkgs,
  ...
}:
pkgs.symlinkJoin {
  name = "fcitx5-with-addons-${pkgs.fcitx5.version}";

  paths = with pkgs;
    [
      fcitx5
      libsForQt5.fcitx5-qt
      qt6Packages.fcitx5-qt
      fcitx5-gtk
    ]
    ++ lib.optionals withConfigtool [
      qt6Packages.fcitx5-configtool
    ]
    ++ addons;

  buildInputs = with pkgs; [
    librsvg
  ];

  nativeBuildInputs = with pkgs; [
    makeBinaryWrapper
  ];

  postBuild =
    # bash
    ''
      wrapProgram $out/bin/fcitx5 \
        --set GDK_PIXBUF_MODULE_FILE "$GDK_PIXBUF_MODULE_FILE" \
        --prefix FCITX_ADDON_DIRS : "$out/lib/fcitx5" \
        --suffix XDG_DATA_DIRS : "$out/share" \
        --suffix PATH : "$out/bin" \
        --suffix LD_LIBRARY_PATH : "${
        lib.makeLibraryPath (lib.flatten (map (x: x.extraLdLibraries or []) addons))
      }"

      ${lib.optionalString withConfigtool
        # bash
        ''
          wrapProgram $out/bin/fcitx5-config-qt --prefix FCITX_ADDON_DIRS : "$out/lib/fcitx5"
        ''}

      pushd $out
      grep -Rl --include=\*.{desktop,service} share/applications etc/xdg/autostart share/dbus-1/services -e ${pkgs.fcitx5} | while read -r file; do
        rm $file
        cp ${pkgs.fcitx5}/$file $file
        substituteInPlace $file --replace-fail ${pkgs.fcitx5} $out
      done
      popd
    '';

  inherit (pkgs.fcitx5) meta;
}
