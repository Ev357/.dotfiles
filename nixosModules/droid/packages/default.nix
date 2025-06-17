{ lib, config, pkgs, ... }:

{
  options.droidModules.packages = {
    enable = lib.mkEnableOption "enables packages";
  };

  config = lib.mkIf config.droidModules.packages.enable {
    environment.systemPackages = with pkgs; [
      file
      acl
      attr
      bashInteractive
      bzip2
      cpio
      curl
      diffutils
      findutils
      gawk
      stdenv.cc.libc
      getent
      getconf
      gnugrep
      gnupatch
      gnused
      gnutar
      gzip
      xz
      less
      libcap
      ncurses
      netcat
      mkpasswd
      procps
      su
      time
      util-linux
      which
      zstd
    ];
  };
}
