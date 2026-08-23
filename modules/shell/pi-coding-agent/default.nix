{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.pi-coding-agent;
in {
  imports = [
    ./patch
  ];

  config = lib.mkIf cfg.enable {
    programs.pi-coding-agent = {
      configDir = "${config.xdg.configHome}/pi/agent";

      extraPackages = with pkgs; [
        bun
      ];

      settings = {
        npmCommand = ["bun"];
        defaultProvider = "antigravity";
        defaultModel = "claude-opus-4-6";
        theme = "catppuccin-tui-macchiato";
        quietStartup = true;
        enableInstallTelemetry = false;
        terminal.showTerminalProgress = true;

        packages = [
          "npm:pi-antigravity"
          "npm:pi-image-tools"
          "npm:pi-web-access"
          "git:github.com/Ev357/pi-vimmode@fix-agent-directory-config"
          "npm:pi-catppuccin-tui"
          "git:github.com/DietrichGebert/ponytail"
        ];

        piVimMode = {
          ui.status.enabled = false;
        };
      };

      keybindings = {
        "app.clipboard.pasteImage" = [];
      };

      extensions = {
        "hide-footer.ts" = ./hide-footer.ts;
      };
    };

    home.file = {
      "${cfg.configDir}/npm/node_modules/pi-image-tools/config/config.json" = {
        text = builtins.toJSON {
          debug = false;
          shortcuts = {
            pasteImage = ["ctrl+v"];
            avoidBuiltinConflicts = true;
            suppressBuiltinConflictWarnings = true;
          };
        };
      };
      "${config.xdg.configHome}/ponytail/config.json".text = builtins.toJSON {
        quietStartup = true;
      };
      "${cfg.configDir}/web-search.json" = {
        text = builtins.toJSON {
          autoOpenBrowser = false;
          workflow = "auto-summary";
        };
      };
    };
  };
}
