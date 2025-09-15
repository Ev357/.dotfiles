{
  pkgs,
  inputs,
  ...
}: {
  services.cloudflared = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.system}.cloudflared;
  };
}
