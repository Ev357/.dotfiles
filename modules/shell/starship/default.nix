{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.starship.enable {
    xdg.configFile."starship.toml".source = ./starship.toml;
  };
}
