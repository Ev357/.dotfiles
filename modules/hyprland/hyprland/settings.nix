{ config, pkgs, ... }:

let
  cfg = config.wayland.windowManager.hyprland;
in
{
  wayland.windowManager.hyprland.settings = {
    source = "~/.config/hypr/hyprland/colors.conf";

    "$terminal" = "ghostty";
    "$fileManager" = "ghostty -e yazi";
    "$menu" = "rofi -show drun";

    env = [
      "HYPRSHOT_DIR,$HOME/Pictures/screenshots"
      "ELECTRON_OZONE_PLATFORM_HINT,wayland"
      "NIXOS_OZONE_WL,1"
    ];

    general = {
      gaps_in = 6;
      gaps_out = 10;

      border_size = 1;

      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      resize_on_border = true;

      allow_tearing = true;

      layout = "dwindle";
    };

    decoration = {
      rounding = 14;

      active_opacity = "1.0";
      inactive_opacity = "1.0";

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };

      blur = {
        enabled = true;
        size = 3;
        passes = 1;

        vibrancy = "0.1696";
      };
    };

    animations = {
      enabled = "yes, please :)";

      bezier = [ "easeOutQuint,0.23,1,0.32,1" "easeInOutCubic,0.65,0.05,0.36,1" "linear,0,0,1,1" "almostLinear,0.5,0.5,0.75,1.0" "quick,0.15,0,0.1,1" ];

      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, linear, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 3.81, easeOutQuint"
        "layersIn, 1, 4, easeOutQuint, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      force_default_wallpaper = 1;
      disable_hyprland_logo = true;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
    };

    input = {
      kb_layout = "cz, us";
      kb_variant = "qwerty";
      kb_options = "grp:alt_shift_toggle";

      follow_mouse = 1;

      sensitivity = 0;

      touchpad = {
        natural_scroll = true;
        scroll_factor = 1;
      };
    };

    gestures = {
      workspace_swipe = true;
    };

    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, Q, exec, $terminal"
      "$mainMod, C, killactive"
      "$mainMod, M, exit"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating"
      "$mainMod, R, exec, $menu"
      "$mainMod, P, pseudo"
      "$mainMod, T, togglesplit"
      "$mainMod, F, fullscreen"
      "$mainMod SHIFT, l, exec, hyprlock"
      "$mainMod SHIFT, p, exec, shutdown now"
      "$mainMod SHIFT, r, exec, reboot"
      "$mainMod SHIFT, h, exec, systemctl suspend"

      "$mainMod SHIFT, m, exec, hyprctl keyword monitor \", preferred, auto-up, 1, mirror, ${cfg.mainMonitorName}\""
      "$mainMod SHIFT, e, exec, hyprctl keyword monitor \", preferred, auto-up, 1\""

      "$mainMod, PRINT, exec, hyprshot -m window"
      ", PRINT, exec, hyprshot -m output"
      "SHIFT, PRINT, exec, hyprshot -m region"

      "$mainMod, h, movefocus, l"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"
      "$mainMod, l, movefocus, r"

      "$mainMod, b, exec, ${pkgs.busybox}/bin/killall -SIGUSR1 waybar"

      "$mainMod, 10, workspace, 1"
      "$mainMod, 11, workspace, 2"
      "$mainMod, 12, workspace, 3"
      "$mainMod, 13, workspace, 4"
      "$mainMod, 14, workspace, 5"
      "$mainMod, 15, workspace, 6"
      "$mainMod, 16, workspace, 7"
      "$mainMod, 17, workspace, 8"
      "$mainMod, 18, workspace, 9"
      "$mainMod, 19, workspace, 10"

      "$mainMod SHIFT, 10, movetoworkspace, 1"
      "$mainMod SHIFT, 11, movetoworkspace, 2"
      "$mainMod SHIFT, 12, movetoworkspace, 3"
      "$mainMod SHIFT, 13, movetoworkspace, 4"
      "$mainMod SHIFT, 14, movetoworkspace, 5"
      "$mainMod SHIFT, 15, movetoworkspace, 6"
      "$mainMod SHIFT, 16, movetoworkspace, 7"
      "$mainMod SHIFT, 17, movetoworkspace, 8"
      "$mainMod SHIFT, 18, movetoworkspace, 9"
      "$mainMod SHIFT, 19, movetoworkspace, 10"

      "$mainMod, S, togglespecialworkspace, magic"
      "$mainMod SHIFT, S, movetoworkspace, special:magic"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      "ALT, q, pass, class:^(com\.mitchellh\.ghostty)$"
    ];

    bindl = [
      ",switch:Lid Switch, exec, hyprlock"

      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
    ];

    binde = [
      "$mainMod CONTROL, h, resizeactive, -20 0"
      "$mainMod CONTROL, j, resizeactive, 0 20"
      "$mainMod CONTROL, k, resizeactive, 0 -20"
      "$mainMod CONTROL, l, resizeactive, 20 0"
    ];

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];

    windowrulev2 = [ "suppressevent maximize, class:.*" "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0" ];
  };
}
