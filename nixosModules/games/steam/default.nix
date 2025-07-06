{ pkgs, ... }:

{
  programs.steam = {
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraPkgs = (pkgs: with pkgs; [
        gamemode
        gamescope
      ]);
    };
  };
}
