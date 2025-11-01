{
  pkgs,
  inputs,
  ...
}: {
  services.cloudflared = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.cloudflared;
  };
}
