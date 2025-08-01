{ lib, config, pkgs, ... }:

{
  options.droidModules.sshd = {
    enable = lib.mkEnableOption "enables sshd";
  };

  config = lib.mkIf config.droidModules.sshd.enable (
    let
      sshdTmpDirectory = "${config.user.home}/.sshd-tmp";
      sshdDirectory = "${config.user.home}/.sshd";
      pathToPubKey = "${config.user.home}/.ssh/id_rsa.pub";
      port = 8022;
    in
    {
      environment.packages = with pkgs; [
        openssh
        (pkgs.writeScriptBin "sshd-start" /* bash */ ''
          #!${pkgs.runtimeShell}

          echo "Starting sshd in non-daemonized way on port ${toString port}"
          ${pkgs.openssh}/bin/sshd -f "${sshdDirectory}/sshd_config" -D
        '')
      ];

      build.activation.sshd = /* bash */ ''
        $DRY_RUN_CMD mkdir $VERBOSE_ARG --parents "${config.user.home}/.ssh"
        $DRY_RUN_CMD cat ${pathToPubKey} > "${config.user.home}/.ssh/authorized_keys"

        if [[ ! -d "${sshdDirectory}" ]]; then
          $DRY_RUN_CMD rm $VERBOSE_ARG --recursive --force "${sshdTmpDirectory}"
          $DRY_RUN_CMD mkdir $VERBOSE_ARG --parents "${sshdTmpDirectory}"

          $VERBOSE_ECHO "Generating host keys..."
          $DRY_RUN_CMD ${pkgs.openssh}/bin/ssh-keygen -t rsa -b 4096 -f "${sshdTmpDirectory}/ssh_host_rsa_key" -N ""

          $VERBOSE_ECHO "Writing sshd_config..."
          $DRY_RUN_CMD echo -e "HostKey ${sshdDirectory}/ssh_host_rsa_key\nPort ${toString port}\n" > "${sshdTmpDirectory}/sshd_config"

          $DRY_RUN_CMD mv $VERBOSE_ARG "${sshdTmpDirectory}" "${sshdDirectory}"
        fi
      '';
    }
  );
}

