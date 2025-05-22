{
  programs.hyprlock.settings = {
    "source" = "$HOME/.config/hypr/hyprland/colors.conf";

    "$accent" = "$mauve";
    "$accentAlpha" = "$mauveAlpha";
    "$font" = "GeistMono Nerd Font";

    general = {
      disable_loading_bar = true;
      hide_cursor = true;
    };

    background = {
      monitor = "";
      blur_passes = 0;
      color = "$base";
    };

    input-field = {
      monitor = "";
      size = "240, 48";
      outline_thickness = 4;
      dots_size = 0.2;
      dots_spacing = 0.2;
      dots_center = true;
      outer_color = "$accent";
      inner_color = "$surface0";
      font_color = "$text";
      fade_on_empty = false;
      placeholder_text = "<span foreground='##$textAlpha'></span>";
      hide_input = false;
      check_color = "$accent";
      fail_color = "$red";
      fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
      capslock_color = "$yellow";
      halign = "center";
      valign = "center";
    };
  };
}
