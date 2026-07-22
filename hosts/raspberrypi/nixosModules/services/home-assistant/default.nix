{
  pkgs,
  inputs,
  ...
}: {
  services.home-assistant = {
    package = inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.home-assistant;
    config = {
      wake_on_lan = {};
      switch = [
        {
          platform = "wake_on_lan";
          name = "Sophie";
          mac = "78:E3:B5:C3:D0:CE";
          host = "sophie-local.evest.dev";
          turn_off = {
            action = "shell_command.turn_off_server";
          };
        }
      ];
      shell_command = {
        turn_off_server = "/run/current-system/sw/bin/ssh -i /var/lib/hass/.ssh/id_ed25519 -o StrictHostKeyChecking=no hass-wol@sophie-local.evest.dev sudo /run/current-system/sw/bin/poweroff";
      };
    };
  };
}
