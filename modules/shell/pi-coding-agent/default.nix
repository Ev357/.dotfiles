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

      models.providers = {
        fastflowlm = {
          name = "FastFlowLM";
          baseUrl = "http://127.0.0.1:52625/v1";
          api = "openai-completions";
          apiKey = "flm-local";
          compat = {
            supportsReasoningEffort = true;
            supportsUsageInStreaming = true;
            supportsDeveloperRole = false;
            supportsFinishReason = false;
            supportsStore = false;
            supportsStrictMode = false;
            maxTokensField = "max_tokens";
          };

          models =
            map (model:
              model
              // {
                thinkingLevelMap = {
                  off = "none";
                  minimal = null;
                  low = "low";
                  medium = "medium";
                  high = "high";
                };
              })
            [
              {
                id = "qwen3.8-distilled:9b";
                name = "Qwen3.8-Distilled-9B-NPU2";
                contextWindow = 32768;
                maxTokens = 8192;
                reasoning = true;
                input = ["text" "image"];
              }
              {
                id = "qwen3.5-claude-code:9b";
                name = "Qwen3.5-9B-Claude-Code-NPU2";
                contextWindow = 32768;
                maxTokens = 8192;
                reasoning = true;
                input = ["text" "image"];
              }
              {
                id = "gemma4-it:e4b";
                name = "Gemma4-E4B-IT-NPU2";
                contextWindow = 65536;
                maxTokens = 8192;
                reasoning = true;
                input = ["text" "image"];
              }
            ];
        };
      };

      extensions = {
        "hide-footer.ts" = ./extensions/hide-footer.ts;
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
