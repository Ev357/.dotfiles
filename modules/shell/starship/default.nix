{
  programs.starship = {
    settings = fromTOML (builtins.readFile ./starship.toml);
  };
}
