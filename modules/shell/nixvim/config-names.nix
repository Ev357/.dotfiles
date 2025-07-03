{ lib, ... }:

{
  options = {
    configNames = {
      homeManager = lib.mkOption {
        type = lib.types.str;
        default = "evest@nixos";
        description = "The name of the home manager configuration";
      };

      nixos = lib.mkOption {
        type = lib.types.str;
        default = "nixos";
        description = "The name of the nixos configuration";
      };
    };
  };
}
