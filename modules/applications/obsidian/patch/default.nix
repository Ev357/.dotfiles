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
      home.activation.obsidian = let
        template = (pkgs.formats.json {}).generate "obsidian.json" ({
            vaults = builtins.listToAttrs (
              map (vault: {
                name = builtins.substring 0 16 (builtins.hashString "md5" vault.target);
                value = {
                  path = "${config.home.homeDirectory}/${vault.target}";
                };
              })
              vaults
            );
            updateDisabled = true;
          }
          // cfg.extraSettings);
      in
        lib.mkForce (lib.hm.dag.entryAfter ["writeBoundary"]
          # bash
          ''
            OBSIDIAN_CONFIG="$HOME/.config/obsidian/obsidian.json"
            if [ -f "$OBSIDIAN_CONFIG" ]; then
              verboseEcho "Merging existing Obsidian config with generated template"
              tmp="$(mktemp)"
              run ${lib.getExe pkgs.jq} -s '(.[0] // {}) * (.[1] // {})' "$OBSIDIAN_CONFIG" "${template}" > "$tmp"
              run install -m644 "$tmp" "$OBSIDIAN_CONFIG"
              rm -f "$tmp"
            else
              verboseEcho "Installing fresh Obsidian config"
              run install -D -m644 "${template}" "$OBSIDIAN_CONFIG"
            fi
          '');
    }
  );
}
