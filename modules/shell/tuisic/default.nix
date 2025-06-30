{ inputs, ... }:

{
  imports = [
    inputs.tuisic.homeManagerModules.default
  ];

  programs.tuisic = { };
}
