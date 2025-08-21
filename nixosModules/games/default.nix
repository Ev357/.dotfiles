{
  lib,
  config,
  inputs,
  pkgs,
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

    hardware.graphics = {
      extraPackages = with pkgs; [
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };

    services = {
      pipewire.lowLatency.enable = lib.mkDefault true;

      xserver.videoDrivers = ["amdgpu"];
    };

    security.rtkit.enable = lib.mkDefault true;

    nixpkgs.overlays = [
      (final: prev: {
        mesa = inputs.working-mesa-nixpkgs.legacyPackages.${prev.system}.mesa;
      })
    ];
  };
}
