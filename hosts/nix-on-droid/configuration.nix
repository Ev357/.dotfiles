{pkgs, ...}: {
  imports = [
    ../../nixosModules/droid
  ];

  droidModules = {
    sshd.enable = true;
    packages.enable = true;
  };

  environment.etcBackupExtension = ".bak";

  user.shell = "${pkgs.nushell}/bin/nu";

  time.timeZone = "Europe/Prague";

  system.stateVersion = "24.05";
}
