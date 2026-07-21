{
  pkgs,
  inputs,
  ...
}: {
  services.cloudflared = {
    package = inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system}.cloudflared;
    tunnels = {
      "00c6b9cc-fe15-4b75-aee9-a3ac9411bf9e" = {
        credentialsFile = "/etc/cloudflared/00c6b9cc-fe15-4b75-aee9-a3ac9411bf9e.json";
        default = "http_status:404";
      };
    };
  };
}
