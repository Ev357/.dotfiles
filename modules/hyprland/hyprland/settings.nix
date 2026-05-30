{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.wayland.windowManager.hyprland;
  inline = lib.generators.mkLuaInline;
in {
  wayland.windowManager.hyprland.settings = {
    terminal._var = "ghostty +new-window";
    fileManager._var = "ghostty -e yazi";
    menu._var = "vicinae toggle";
    mainMod._var = "SUPER";

    config = {
      ecosystem = {enforce_permissions = true;};
      debug = {disable_logs = false;};

      general = {
        allow_tearing = true;
        gaps_in = 6;
        gaps_out = 10;
        layout = "scrolling";
        resize_on_border = true;
        col = {
          active_border = {
            colors = ["rgba(33ccffee)" "rgba(00ff99ee)"];
            angle = 45;
          };
          inactive_border = "rgba(595959aa)";
        };
      };

      decoration = {
        rounding = 14;
        blur = {
          enabled = true;
          brightness = 0.75;
          passes = 2;
          size = 20;
        };
        shadow = {
          enabled = true;
          color = inline "0xee1a1a1a";
        };
      };

      animations = {
        enabled = true;
        workspace_wraparound = true;
      };

      scrolling = {
        column_width = 0.7;
        focus_fit_method = 0;
        follow_focus = false;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        enable_anr_dialog = false;
        force_default_wallpaper = 1;
        key_press_enables_dpms = true;
        mouse_move_enables_dpms = true;
      };

      input = {
        kb_layout = "cz, us";
        kb_options = "grp:alt_shift_toggle";
        kb_variant = "qwerty";
        touchpad = {
          disable_while_typing = false;
          drag_lock = 0;
          natural_scroll = true;
        };
      };
    };

    permission = [
      {
        binary = "${lib.getExe pkgs.hyprpicker}";
        type = "screencopy";
        mode = "allow";
      }
      {
        binary = lib.escapeRegex "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland}/libexec/.xdg-desktop-portal-hyprland-wrapped";
        type = "screencopy";
        mode = "allow";
      }
    ];

    curve = [
      {
        _args = [
          "easeOutQuint"
          {
            type = "bezier";
            points = [[0.23 1] [0.32 1]];
          }
        ];
      }
      {
        _args = [
          "easeInOutCubic"
          {
            type = "bezier";
            points = [[0.65 0.05] [0.36 1]];
          }
        ];
      }
      {
        _args = [
          "linear"
          {
            type = "bezier";
            points = [[0 0] [1 1]];
          }
        ];
      }
      {
        _args = [
          "almostLinear"
          {
            type = "bezier";
            points = [[0.5 0.5] [0.75 1.0]];
          }
        ];
      }
      {
        _args = [
          "quick"
          {
            type = "bezier";
            points = [[0.15 0] [0.1 1]];
          }
        ];
      }
    ];

    animation = [
      {
        leaf = "global";
        enabled = true;
        speed = 10;
        bezier = "default";
      }
      {
        leaf = "border";
        enabled = true;
        speed = 5.39;
        bezier = "easeOutQuint";
      }
      {
        leaf = "windows";
        enabled = true;
        speed = 4.79;
        bezier = "easeOutQuint";
      }
      {
        leaf = "windowsIn";
        enabled = true;
        speed = 4.1;
        bezier = "easeOutQuint";
        style = "popin 87%";
      }
      {
        leaf = "windowsOut";
        enabled = true;
        speed = 1.49;
        bezier = "linear";
        style = "popin 87%";
      }
      {
        leaf = "fadeIn";
        enabled = true;
        speed = 1.73;
        bezier = "almostLinear";
      }
      {
        leaf = "fadeOut";
        enabled = true;
        speed = 1.46;
        bezier = "almostLinear";
      }
      {
        leaf = "fade";
        enabled = true;
        speed = 3.03;
        bezier = "quick";
      }
      {
        leaf = "layers";
        enabled = true;
        speed = 3.81;
        bezier = "easeOutQuint";
      }
      {
        leaf = "layersIn";
        enabled = true;
        speed = 4;
        bezier = "easeOutQuint";
        style = "fade";
      }
      {
        leaf = "layersOut";
        enabled = true;
        speed = 1.5;
        bezier = "linear";
        style = "fade";
      }
      {
        leaf = "fadeLayersIn";
        enabled = true;
        speed = 1.79;
        bezier = "almostLinear";
      }
      {
        leaf = "fadeLayersOut";
        enabled = true;
        speed = 1.39;
        bezier = "almostLinear";
      }
      {
        leaf = "workspaces";
        enabled = true;
        speed = 5;
        bezier = "almostLinear";
        style = "slidefadevert";
      }
      {
        leaf = "workspacesIn";
        enabled = true;
        speed = 1.21;
        bezier = "almostLinear";
        style = "slidefadevert";
      }
      {
        leaf = "workspacesOut";
        enabled = true;
        speed = 1.94;
        bezier = "almostLinear";
        style = "slidefadevert";
      }
      {
        leaf = "specialWorkspace";
        enabled = true;
        speed = 25;
        bezier = "almostLinear";
        style = "fade";
      }
      {
        leaf = "specialWorkspaceIn";
        enabled = true;
        speed = 2.42;
        bezier = "almostLinear";
        style = "fade";
      }
      {
        leaf = "specialWorkspaceOut";
        enabled = true;
        speed = 1.94;
        bezier = "almostLinear";
        style = "fade";
      }
    ];

    gesture = [
      {
        fingers = 3;
        direction = "vertical";
        action = "workspace";
      }
      {
        fingers = 3;
        direction = "horizontal";
        action = "scroll_move";
      }
    ];

    bind =
      [
        {_args = [(inline ''mainMod .. " + Q"'') (inline ''hl.dsp.exec_cmd(terminal)'')];}
        {_args = [(inline ''mainMod .. " + C"'') (inline ''hl.dsp.window.close()'')];}
        {_args = [(inline ''mainMod .. " + M"'') (inline ''hl.dsp.exec_cmd("hyprshutdown")'')];}
        {_args = [(inline ''mainMod .. " + E"'') (inline ''hl.dsp.exec_cmd(fileManager)'')];}
        {_args = [(inline ''mainMod .. " + V"'') (inline ''hl.dsp.window.float({ action = "toggle" })'')];}
        {_args = [(inline ''mainMod .. " + F"'') (inline ''hl.dsp.window.fullscreen()'')];}
        {_args = [(inline ''mainMod .. " + R"'') (inline ''hl.dsp.exec_cmd(menu)'')];}
        {_args = [(inline ''mainMod .. " + B"'') (inline ''hl.dsp.exec_cmd("${pkgs.busybox}/bin/killall -SIGUSR1 waybar")'')];}

        {_args = [(inline ''mainMod .. " + CONTROL + L"'') (inline ''hl.dsp.exec_cmd("hyprlock")'')];}
        {_args = [(inline ''mainMod .. " + CONTROL + H"'') (inline ''hl.dsp.exec_cmd("systemctl suspend")'')];}
        {_args = [(inline ''mainMod .. " + CONTROL + P"'') (inline ''hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'shutdown now'")'')];}
        {_args = [(inline ''mainMod .. " + CONTROL + R"'') (inline ''hl.dsp.exec_cmd("hyprshutdown -t 'Restarting...' --post-cmd 'systemctl reboot'")'')];}
        {_args = [(inline ''mainMod .. " + CONTROL + M"'') (inline ''hl.dsp.exec_cmd("hyprctl keyword monitor \", preferred, auto-up, 1, mirror, ${cfg.mainMonitorName}\"")'')];}
        {_args = [(inline ''mainMod .. " + CONTROL + E"'') (inline ''hl.dsp.exec_cmd("hyprctl keyword monitor \", preferred, auto-up, 1\"")'')];}

        {_args = [(inline ''mainMod .. " + H"'') (inline ''hl.dsp.layout("move -col")'')];}
        {_args = [(inline ''mainMod .. " + J"'') (inline ''hl.dsp.focus({ direction = "d" })'')];}
        {_args = [(inline ''mainMod .. " + K"'') (inline ''hl.dsp.focus({ direction = "u" })'')];}
        {_args = [(inline ''mainMod .. " + L"'') (inline ''hl.dsp.layout("move +col")'')];}

        {_args = [(inline ''mainMod .. " + SHIFT + H"'') (inline ''hl.dsp.window.move({ direction = "l" })'')];}
        {_args = [(inline ''mainMod .. " + SHIFT + J"'') (inline ''hl.dsp.window.move({ direction = "d" })'')];}
        {_args = [(inline ''mainMod .. " + SHIFT + K"'') (inline ''hl.dsp.window.move({ direction = "u" })'')];}
        {_args = [(inline ''mainMod .. " + SHIFT + L"'') (inline ''hl.dsp.window.move({ direction = "r" })'')];}

        {_args = [(inline ''mainMod .. " + SHIFT + O"'') (inline ''hl.dsp.layout("swapcol r")'')];}
        {_args = [(inline ''mainMod .. " + SHIFT + I"'') (inline ''hl.dsp.layout("swapcol l")'')];}

        {_args = [(inline ''mainMod .. " + O"'') (inline ''hl.dsp.layout("colresize +conf")'')];}
        {_args = [(inline ''mainMod .. " + I"'') (inline ''hl.dsp.layout("colresize -conf")'')];}
        {_args = [(inline ''mainMod .. " + P"'') (inline ''hl.dsp.layout("promote")'')];}
        {_args = [(inline ''mainMod .. " + T"'') (inline ''hl.dsp.layout("fit visible")'')];}

        {_args = [(inline ''mainMod .. " + PRINT"'') (inline ''hl.dsp.exec_cmd("hyprshot -m window -z")'')];}
        {_args = ["PRINT" (inline ''hl.dsp.exec_cmd("hyprshot -m output -z")'')];}
        {_args = ["SHIFT + PRINT" (inline ''hl.dsp.exec_cmd("hyprshot -m region -z")'')];}

        {_args = ["ALT + Q" (inline ''hl.dsp.pass({ window = "class:^(com.mitchellh.ghostty)$" })'')];}

        {_args = [(inline ''mainMod .. " + S"'') (inline ''hl.dsp.workspace.toggle_special("magic")'')];}
        {_args = [(inline ''mainMod .. " + SHIFT + S"'') (inline ''hl.dsp.window.move({ workspace = "special:magic" })'')];}
        {_args = [(inline ''mainMod .. " + mouse_down"'') (inline ''hl.dsp.focus({ workspace = "e+1" })'')];}
        {_args = [(inline ''mainMod .. " + mouse_up"'') (inline ''hl.dsp.focus({ workspace = "e-1" })'')];}

        {_args = [(inline ''mainMod .. " + mouse:272"'') (inline ''hl.dsp.window.drag()'') {mouse = true;}];}
        {_args = [(inline ''mainMod .. " + mouse:273"'') (inline ''hl.dsp.window.resize()'') {mouse = true;}];}

        {_args = [(inline ''mainMod .. " + plus"'') (inline ''hl.dsp.layout("colresize +0.1")'') {repeating = true;}];}
        {_args = [(inline ''mainMod .. " + minus"'') (inline ''hl.dsp.layout("colresize -0.1")'') {repeating = true;}];}

        {
          _args = [
            "XF86AudioRaiseVolume"
            (inline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+")'')
            {
              locked = true;
              repeating = true;
            }
          ];
        }
        {
          _args = [
            "XF86AudioLowerVolume"
            (inline ''hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")'')
            {
              locked = true;
              repeating = true;
            }
          ];
        }
        {
          _args = [
            "XF86AudioMute"
            (inline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")'')
            {
              locked = true;
              repeating = true;
            }
          ];
        }
        {
          _args = [
            "XF86AudioMicMute"
            (inline ''hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")'')
            {
              locked = true;
              repeating = true;
            }
          ];
        }
        {
          _args = [
            "XF86MonBrightnessUp"
            (inline ''hl.dsp.exec_cmd("brightnessctl s 10%+")'')
            {
              locked = true;
              repeating = true;
            }
          ];
        }
        {
          _args = [
            "XF86MonBrightnessDown"
            (inline ''hl.dsp.exec_cmd("brightnessctl s 10%-")'')
            {
              locked = true;
              repeating = true;
            }
          ];
        }

        {_args = ["switch:Lid Switch" (inline ''hl.dsp.exec_cmd("hyprlock")'') {locked = true;}];}
        {_args = ["XF86AudioNext" (inline ''hl.dsp.exec_cmd("playerctl next")'') {locked = true;}];}
        {_args = ["XF86AudioPause" (inline ''hl.dsp.exec_cmd("playerctl play-pause")'') {locked = true;}];}
        {_args = ["XF86AudioPlay" (inline ''hl.dsp.exec_cmd("playerctl play-pause")'') {locked = true;}];}
        {_args = ["XF86AudioPrev" (inline ''hl.dsp.exec_cmd("playerctl previous")'') {locked = true;}];}
      ]
      ++ builtins.concatLists (builtins.genList (
          x: let
            i = x + 10;
            workspace = i - 9;
          in [
            {_args = [(inline ''mainMod .. " + code:${toString i}"'') (inline ''hl.dsp.focus({ workspace = ${toString workspace} })'')];}
            {_args = [(inline ''mainMod .. " + SHIFT + code:${toString i}"'') (inline ''hl.dsp.window.move({ workspace = ${toString workspace} })'')];}
          ]
        )
        10);

    layer_rule = [
      {
        name = "vicinae-blur";
        match = {namespace = "^vicinae$";};
        blur = true;
        ignore_alpha = 0;
      }
      {
        name = "vicinae-no-animation";
        match = {namespace = "^vicinae$";};
        no_anim = true;
      }
    ];

    window_rule = [
      {
        name = "suppress-maximize-events";
        match = {class = ".*";};
        suppress_event = "maximize";
      }
      {
        name = "fix-xwayland-drags";
        match = {
          class = "^$";
          title = "^$";
          xwayland = true;
          float = true;
          fullscreen = false;
          pin = false;
        };
        no_focus = true;
      }
      {
        name = "move-hyprland-run";
        match = {class = "hyprland-run";};
        float = true;
        move = "20 monitor_h-120";
      }
    ];
  };
}
