{
  plugins.minuet.settings = {
    virtualtext = {
      auto_trigger_ft = ["*"];
      keymap = {
        accept = "<A-a>";
        accept_line = "<A-s>";
        accept_n_lines = "<A-z>";
        next = "<A-n>";
        prev = "<A-p>";
        dismiss = "<A-e>";
      };
    };

    provider = "codestral";
    provider_options = {
      codestral = {
        model = "codestral-latest";
        end_point = "https://codestral.mistral.ai/v1/fim/completions";
        stream = true;
        api_key.__raw =
          # lua
          ''
            function()
              local config_home = vim.env.XDG_CONFIG_HOME
              if type(config_home) ~= "string" or config_home == "" then
                  config_home = vim.fn.expand("~/.config")
              end

              local key_path = config_home .. "/codestral/key"
              local file = io.open(key_path, "r")

              if not file then
                  return ""
              end

              local key = file:read("*a")
              file:close()
              return key:gsub("%s+", "")
            end
          '';
      };
    };
  };
}
