{
  programs.git = {
    settings = {
      alias = {
        undo = "reset --soft HEAD^";
      };
      user = {
        email = "evest.dev@gmail.com";
        name = "Ev357";
      };
      credential.helper = "store";
      init.defaultBranch = "main";
      core = {
        editor = "nvim --clean";
        autocrlf = "input";
        compression = 9;
        preloadindex = true;
      };
      status.showUntrackedFiles = "all";
      safe.directory = "/storage/emulated/0/Documents/Obsidian";
    };
    lfs.enable = true;
  };
}
