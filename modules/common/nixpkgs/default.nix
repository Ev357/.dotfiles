{inputs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
      ];
    };
    overlays = [
      inputs.nur.overlays.default
    ];
  };
}
