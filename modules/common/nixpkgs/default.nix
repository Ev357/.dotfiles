{inputs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
        "electron-39.8.10"
      ];
    };
    overlays = [
      inputs.nur.overlays.default
    ];
  };
}
