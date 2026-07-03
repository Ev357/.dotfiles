{inputs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-39.8.10"
      ];
    };
    overlays = [
      inputs.nur.overlays.default
    ];
  };
}
