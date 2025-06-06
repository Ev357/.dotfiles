{ pkgs, ... }:

{
  programs.ssh = {
    matchBlocks = {
      "ssh.evest.dev" = {
        proxyCommand = "${pkgs.cloudflared}/bin/cloudflared access ssh --hostname %h";
      };
    };
  };
}
