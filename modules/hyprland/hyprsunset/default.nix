{
  imports = [
    ./patch
  ];

  services.hyprsunset = {
    extraArgs = ["--identity"];

    transitions = {
      night-start = {
        calendar = "*-*-* 00:00:00";
        requests = [
          ["temperature" "3500"]
        ];
      };

      night-end = {
        calendar = "*-*-* 06:00:00";
        requests = [
          ["identity"]
        ];
      };
    };
  };
}
