{ config, pkgs, ... }:

{
  enable = true;
  package = pkgs.rofi-wayland;
  theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      "configuration" = {
        terminal = "ghostty";
      };

      "*" = {
        bg-col = mkLiteral "#24273a";
        bg-col-light = mkLiteral "#24273a";
        border-col = mkLiteral "#8aadf4";
        selected-col = mkLiteral "#24273a";
        blue = mkLiteral "#8aadf4";
        fg-col = mkLiteral "#cad3f5";
        fg-col2 = mkLiteral "#ed8796";
        grey = mkLiteral "#6e738d";

        width = 600;
        font = "GeistMono Nerd Font 14";
      };

      "element-text, element-icon, mode-switcher" = {
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };

      "element-text selected" = {
        text-color = mkLiteral "@fg-col2";
      };


      "window" = {
        height = mkLiteral "360px";
        border = mkLiteral "2px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "5px";
      };


      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = mkLiteral "[prompt,entry]";
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "5px";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
      };

      "entry" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 10px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
        placeholder = "";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "@bg-col";
      };

      "element normal normal, button" = {
        background-color = mkLiteral "@fg-col";
      };

      "element selected.normal" = {
        background-color = mkLiteral "@bg-col";
      };

      "element alternate.alternate" = {
        background-color = mkLiteral "@bg-col";
      };

      "element normal.normal" = {
        background-color = mkLiteral "@bg-col";
      };

      "element-icon" = {
        size = mkLiteral "25px";
      };

      "element selected" = {
        background-color = mkLiteral "@selected-col";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
      };

      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
        border-radius = mkLiteral "5px";
      };

      "textbox" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "@blue";
        background-color = mkLiteral "@bg-col-light";
      };
    };
}
