# Temporary hash mismatch fix
{
  pkgs,
  inputs,
  ...
}: let
  osu-web-rev = "96e384d5932c0113d1ad8fa8c6ac1052d1e22268";
  osu-mime-spec-rev = "a715a74c2188297e61ac629abaed27fa56f0538c";
in
  inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.osu-mime.overrideAttrs {
    srcs = [
      (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/ppy/osu-web/${osu-web-rev}/public/images/layout/osu-logo-triangles.svg";
        sha256 = "4a6vm4H6iOmysy1/fDV6PyfIjfd1/BnB5LZa3Z2noa8=";
      })
      (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/ppy/osu-web/${osu-web-rev}/public/images/layout/osu-logo-white.svg";
        sha256 = "XvYBIGyvTTfMAozMP9gmr3uYEJaMcvMaIzwO7ZILrkY=";
      })
      (pkgs.fetchurl {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/osu-file-extensions.xml?h=osu-mime&id=${osu-mime-spec-rev}";
        sha256 = "sha256-XCbVjUfcqKlEFauZHUeQVhnFD5SoUHBUt3lEetamnhA=";
      })
    ];
  }
