{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.starship.enable {
    programs.starship = {
      enableNushellIntegration = true;
    };

    xdg.configFile."starship.toml".source = ./starship.toml;
  };
}
