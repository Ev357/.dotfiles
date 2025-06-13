{ pkgs, stdenv, system, ... }:

let
  platformMap = {
    "x86_64-linux" = "linux-amd64";
    "aarch64-linux" = "linux-arm64";
  };

  platform = platformMap.${system};

  hashes = {
    "x86_64-linux" = "sha256-FzJ24zcPNmST+4GOvjPMojqWAdchyjwDCFs/g46vPKk=";
    "aarch64-linux" = "sha256-Yunu5e1hc6e0036zN78TO8ptVOHLiYWqFiM3XcFy6w4=";
  };
in
stdenv.mkDerivation rec {
  pname = "cloudflared";
  version = "2025.6.0";
  src = pkgs.fetchurl {
    url = "https://github.com/cloudflare/cloudflared/releases/download/${version}/cloudflared-${platform}";
    sha256 = hashes.${system};
  };
  dontUnpack = true;
  installPhase = /* bash */ ''
    mkdir -p $out/bin
    cp $src $out/bin/cloudflared
    chmod +x $out/bin/cloudflared
  '';
}
