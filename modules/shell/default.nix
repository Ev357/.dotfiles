{ lib, config, ... }:

{
  imports = [
    ./btop
    ./direnv
    ./eza
    ./fzf
    ./git
    ./nixvim
    ./starship
    ./ssh
    ./yazi
    ./zoxide
    ./zsh
    ./packages
  ];

  options.modules.shell = {
    enable = lib.mkEnableOption "enables shell";
  };

  config = lib.mkIf config.modules.shell.enable {
    modules.shell.packages.enable = lib.mkDefault true;
    programs = {
      bat.enable = lib.mkDefault true;
      btop.enable = lib.mkDefault true;
      direnv.enable = lib.mkDefault true;
      eza.enable = lib.mkDefault true;
      fzf.enable = lib.mkDefault true;
      git.enable = lib.mkDefault true;
      nixvim.enable = lib.mkDefault true;
      ssh.enable = lib.mkDefault true;
      starship.enable = lib.mkDefault true;
      yazi.enable = lib.mkDefault true;
      zoxide.enable = lib.mkDefault true;
      zsh.enable = lib.mkDefault true;
    };

    stylix.enable = true;
  };
}
