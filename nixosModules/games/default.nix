{ lib, config, inputs, ... }:

{
  imports = [
    inputs.nix-gaming.nixosModules.pipewireLowLatency
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

    services = {
      pipewire.lowLatency.enable = lib.mkDefault true;

      xserver.videoDrivers = [ "amdgpu" ];
    };

    security.rtkit.enable = lib.mkDefault true;
  };
}
