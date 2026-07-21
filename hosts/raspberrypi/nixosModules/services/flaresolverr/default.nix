{
  pkgs,
  inputs,
  ...
}: {
  services.flaresolverr = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.flaresolverr;
    settings = {
      PROXY_URL = "socks5://127.0.0.1:40000";
    };
  };
}
