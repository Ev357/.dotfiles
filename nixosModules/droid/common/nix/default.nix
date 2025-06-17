let
  nixConfig = import ../../../common/nix;
  settings = nixConfig.nix.settings;

  experimentalFeatures = builtins.concatStringsSep " " settings.experimental-features;
in
{
  nix = {
    extraOptions = ''
      experimental-features = ${experimentalFeatures}
    '';
    substituters = settings.extra-substituters;
    trustedPublicKeys = settings.extra-trusted-public-keys;
  };
}
