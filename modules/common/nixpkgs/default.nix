{inputs, ...}: {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        # bitwarden
        "electron-39.8.10"
        # vue-language-server
        "pnpm-10.34.0"
      ];
    };
    overlays = [
      inputs.nur.overlays.default
    ];
  };
}
