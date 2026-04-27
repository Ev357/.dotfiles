{pkgs, ...}: {
  programs.steam = {
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          gamemode
          gamescope
        ];
    };
  };
}
