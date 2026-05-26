{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim =
    (import ./standalone.nix {inherit pkgs inputs;})
    // {
      defaultEditor = true;
      version.enableNixpkgsReleaseCheck = false;

      _module.args = {
        inherit inputs;
      };
    };
}
