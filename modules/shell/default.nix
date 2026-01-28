{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-index-database.homeModules.nix-index
    ./atuin
    ./btop
    ./bun
    ./carapace
    ./direnv
    ./gemini-cli
    ./git
    ./nh
    ./nixvim
    ./nushell
    ./packages
    ./ssh
    ./starship
    ./tano
    ./template-manager
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
      atuin.enable = lib.mkDefault true;
      btop.enable = lib.mkDefault true;
      bun.enable = lib.mkDefault true;
      carapace.enable = lib.mkDefault true;
      bat.enable = lib.mkDefault true;
      direnv.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      nh.enable = lib.mkDefault true;
      nixvim.enable = lib.mkDefault true;
      ssh.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
      template-manager.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;
      nushell.enable = lib.mkDefault true;
      nix-index-database.comma.enable = lib.mkDefault true;
      zellij.enable = lib.mkDefault true;
      tano.enable = lib.mkDefault true;
      cava.enable = lib.mkDefault true;
      fd.enable = lib.mkDefault true;
      bluetuith.enable = lib.mkDefault true;
    };

    stylix.enable = true;
  };
}
