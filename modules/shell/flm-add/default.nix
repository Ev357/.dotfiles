{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.flm-add = {
    enable = lib.mkEnableOption "enables flm-add";
  };

  config = lib.mkIf config.programs.flm-add.enable {
    home = {
      packages = with pkgs; [
        nur.repos.Ev357.flm-add
      ];

      sessionVariables = {
        FLM_CONFIG_PATH = "${config.xdg.configHome}/flm/model_list.json";
        FLM_XCLBIN_PATH = "${config.xdg.configHome}/flm";
      };
    };
  };
}
