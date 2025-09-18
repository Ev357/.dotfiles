{pkgs, ...}: {
  programs.chromium = {
    package = pkgs.nur.repos.Ev357.helium;
    extensions = [
      {id = "ddkjiahejlhfcafbddmgiahcphecmpfh";}
    ];
  };
}
