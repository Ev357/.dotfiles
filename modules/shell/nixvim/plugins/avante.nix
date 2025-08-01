{
  plugins.avante.settings = {
    provider = "ollama";
    providers = {
      # https://github.com/yetone/avante.nvim/issues/2127
      ollama = {
        __inherited_from = "openai";
        api_key_name = "";
        endpoint = "http://localhost:11434/v1";
        model = "llama3.2:3b";
        mode = "legacy";
      };
    };
    hints.enabled = false;
    behaviour.enable_token_counting = false;
  };
}
