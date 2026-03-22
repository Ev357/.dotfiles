{
  pkgs,
  inputs,
  ...
}: {
  services.cloudflare-warp = {
    package =
      (import inputs.nixpkgs {
        inherit (pkgs.stdenv.hostPlatform) system;
        config.allowUnfree = true;
      }).cloudflare-warp;
    openFirewall = true;
  };
}
