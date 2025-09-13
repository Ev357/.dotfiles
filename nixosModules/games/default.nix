{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
    inputs.nix-gaming.nixosModules.wine
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
      wine.ntsync.enable = lib.mkDefault true;
    };

    services = {
      pipewire.lowLatency.enable = lib.mkDefault true;
    };

    security.rtkit.enable = lib.mkDefault true;
  };
}
