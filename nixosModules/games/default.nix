{ lib, config, ... }:

{
  imports = [
    ./steam
    ./wootility
  ];

  options.modules.games = {
    enable = lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.modules.games.enable {
    modules.games.wootility.enable = lib.mkDefault true;
    programs = {
      steam.enable = lib.mkDefault true;
      gamemode.enable = lib.mkDefault true;
    };
  };
}
