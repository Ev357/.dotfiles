{
  config,
  lib,
  ...
}: let
  cfg = config.programs.pi-coding-agent;
in {
  options.programs.pi-coding-agent = {
    extensions = lib.mkOption {
      type = with lib.types; attrsOf (either lines path);
      default = {};
      description = "Custom extensions written to extensions/ inside Pi's configDir.";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file =
      lib.mapAttrs' (
        name: content:
          lib.nameValuePair "${cfg.configDir}/extensions/${name}" (
            if lib.hm.strings.isPathLike content
            then {source = content;}
            else {text = content;}
          )
      )
      cfg.extensions;
  };
}
