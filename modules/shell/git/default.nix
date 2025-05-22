{
  programs.git = {
    lfs.enable = true;
    userName = "Ev357";
    userEmail = "evest.dev@gmail.com";
    aliases = {
      undo = "reset --soft HEAD^";
    };
    extraConfig = {
      credential.helper = "store";
      init.defaultBranch = "main";
      core = {
        editor = "nvim --clean";
        autocrlf = "input";
        compression = 9;
        preloadindex = true;
      };
      status.showUntrackedFiles = "all";
      safe.directory = "/etc/nixos";
    };
  };
}
