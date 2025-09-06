{
  # https://github.com/nix-community/home-manager/pull/7783
  imports = [
    ./patch
  ];

  services.hyprsunset.settings = {
    profile = [
      {
        time = "6:00";
        identity = true;
      }
      {
        time = "00:00";
        temperature = 3500;
        gamma = 0.4;
      }
    ];
  };
}
