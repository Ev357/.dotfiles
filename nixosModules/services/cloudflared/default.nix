{pkgs, ...}: {
  services.cloudflared = {
    package = pkgs.callPackage ./package {};
  };
}
