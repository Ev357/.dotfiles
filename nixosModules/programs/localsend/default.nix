{pkgs, ...}: {
  programs.localsend = {
    package = pkgs.emptyDirectory;
    openFirewall = true;
  };
}
