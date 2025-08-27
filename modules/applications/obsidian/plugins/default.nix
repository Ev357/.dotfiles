{pkgs, ...}: {
  programs.obsidian.defaultSettings.communityPlugins = [
    {
      pkg = pkgs.nur.repos.Ev357.cmdr;
      settings = builtins.fromJSON (builtins.readFile ./cmdr/data.json);
    }
    {
      pkg = pkgs.nur.repos.Ev357.folder-notes;
      settings = builtins.fromJSON (builtins.readFile ./folder-notes/data.json);
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-excalidraw-plugin;
      settings = builtins.fromJSON (builtins.readFile ./obsidian-excalidraw-plugin/data.json);
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-git;
      settings = builtins.fromJSON (builtins.readFile ./obsidian-git/data.json);
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-hider;
      settings = builtins.fromJSON (builtins.readFile ./obsidian-hider/data.json);
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-relative-line-numbers;
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-scroll-offset;
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-style-settings;
      settings = builtins.fromJSON (builtins.readFile ./obsidian-style-settings/data.json);
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-vim-yank-highlight;
    }
    {
      pkg = pkgs.nur.repos.Ev357.obsidian-vimrc-support;
    }
  ];
}
