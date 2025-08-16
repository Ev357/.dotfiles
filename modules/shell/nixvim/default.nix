{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim =
    (import ./standalone.nix {inherit pkgs;})
    // {
      defaultEditor = true;

      _module.args = {
        inherit inputs;
      };
    };
}
