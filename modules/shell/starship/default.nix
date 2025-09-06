{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.starship.enable {
    programs.starship = {
      enableNushellIntegration = true;
    };

    home.file.".config/starship.toml".source = ./starship.toml;
  };
}
