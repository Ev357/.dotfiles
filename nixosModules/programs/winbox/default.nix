{pkgs, ...}: {
  programs.winbox = {
    openFirewall = true;
    package = pkgs.emptyDirectory;
  };
}
