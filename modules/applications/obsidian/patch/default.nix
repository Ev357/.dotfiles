{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.obsidian;
in {
  options.programs.obsidian = {
    extraSettings = lib.mkOption {
      description = "Additional settings to include in obsidian.json.";
      type = lib.types.attrsOf lib.types.anything;
      default = {};
    };
  };

  config = lib.mkIf cfg.enable (
    let
      vaults = builtins.filter (vault: vault.enable == true) (builtins.attrValues cfg.vaults);
    in {
      xdg.configFile."obsidian/obsidian.json".source =
        lib.mkForce
        (
          (pkgs.formats.json {}).generate "obsidian.json" ({
              vaults = builtins.listToAttrs (
                builtins.map
                (vault: {
                  name = builtins.hashString "md5" vault.target;
                  value =
                    {
                      path = "${config.home.homeDirectory}/${vault.target}";
                    }
                    // (lib.attrsets.optionalAttrs ((builtins.length vaults) == 1) {
                      open = true;
                    });
                })
                vaults
              );
              updateDisabled = true;
            }
            // cfg.extraSettings)
        );
    }
  );
}
