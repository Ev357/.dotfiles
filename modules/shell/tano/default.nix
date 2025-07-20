{ inputs, ... }:

{
  imports = [
    inputs.tano.homeManagerModules.default
  ];

  programs.tuisic = { };
}
