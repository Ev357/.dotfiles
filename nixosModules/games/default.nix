{ lib, config, ... }:

{
  imports = [
    ./wootility
  ];

  options.modules.games = {
    enable = lib.mkEnableOption "enables games";
  };

  config = lib.mkIf config.modules.games.enable {
    modules.games.wootility.enable = lib.mkDefault true;
  };
}
