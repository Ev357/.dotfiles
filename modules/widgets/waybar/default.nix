{ config, lib, ... }:

{
  config = lib.mkIf config.programs.waybar.enable {
    programs.waybar = {
      settings = {
        mainBar = {
          start_hidden = true;

          layer = "top";
          position = "top";
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "cava" ];
          modules-right = [ "power-profiles-daemon" "battery" "tray" "clock" ];

          margin-top = 10;
          margin-left = 10;
          margin-right = 10;
          margin-bottom = 4;

          "hyprland/workspaces" = {
            disable-scroll = true;
            sort-by-name = true;
            format = "{icon}";
            format-icons = {
              default = "";
            };
          };

          cava = {
            autosens = 1;
            bars = 20;
            hide_on_silence = true;
            sleep_timer = 2;
            method = "pipewire";
            bar_delimiter = 0;
            monstercat = true;
            waves = true;
            format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
          };

          power-profiles-daemon = {
            format = "{icon}";
            tooltip = false;
            format-icons = {
              default = "󱐋";
              performance = "󱐋";
              balanced = "󰗑";
              power-saver = "󰌪";
            };
          };

          battery = {
            format-charging = "󰂄";
            format = "{icon}";
            format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            tooltip-format = "{capacity}%";
          };

          tray = {
            icon-size = 21;
            spacing = 8;
          };

          clock = {
            timezone = "Europe/Prague";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%d/%m/%Y}";
            format = "{:%H:%M}";
          };
        };
      };

      systemd.enable = true;

      style = builtins.readFile ./style.css;
    };


    xdg.configFile."waybar/macchiato.css".text = builtins.readFile ./macchiato.css;
  };
}



