{ lib, config, ... }:

{
  options.modules.hyprland.hyprcursor = {
    enable = lib.mkEnableOption "enables hyprcursor";
  };

  config = lib.mkIf config.modules.hyprland.hyprcursor.enable {
    home.file.".icons/hypr_Bibata-Modern-Classic/".source = builtins.fetchTarball {
      url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Classic.tar.gz";
      sha256 = "08q5l2sywc0s70zdn7jvr0rbzz0w8j18wmlkf2x1l64y93lbvzsj";
    };
  };
}
