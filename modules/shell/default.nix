{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.nix-index
    ./btop
    ./bun
    ./direnv
    ./git
    ./nixvim
    ./nushell
    ./packages
    ./ssh
    ./starship
    ./tano
    ./yazi
    ./zellij
    ./zoxide
  ];

  options.modules.shell = {
    enable = lib.mkEnableOption "enables shell";
  };

  config = lib.mkIf config.modules.shell.enable {
    modules.shell.packages.enable = lib.mkDefault true;
    programs = {
      btop.enable = lib.mkDefault true;
      bun.enable = lib.mkDefault true;
      bat.enable = lib.mkDefault true;
      direnv.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      nixvim.enable = lib.mkDefault true;
      ssh.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;
      nushell.enable = lib.mkDefault true;
      nix-index-database.comma.enable = lib.mkDefault true;
      zellij.enable = lib.mkDefault true;
      tuisic.enable = lib.mkDefault true;
      cava.enable = lib.mkDefault true;
      fd.enable = lib.mkDefault true;
    };

    stylix.enable = true;
  };
}
