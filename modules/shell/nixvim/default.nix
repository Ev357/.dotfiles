{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    nixpkgs.pkgs = pkgs;

    imports = [
      ./standalone.nix
    ];

    defaultEditor = true;
    version.enableNixpkgsReleaseCheck = false;

    _module.args = {
      inherit inputs;
    };
  };
}
