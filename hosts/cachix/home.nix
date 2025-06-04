{
  imports = [
    ../../modules
  ];

  programs = {
    obsidian.enable = true;
    ags.enable = true;
  };

  services.cachix-agent.enable = true;
}
