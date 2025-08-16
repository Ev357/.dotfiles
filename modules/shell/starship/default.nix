{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.starship.enable {
    programs.starship = {
      enableZshIntegration = true;
    };

    home.file.".config/starship.toml".source = ./starship.toml;
  };
}
