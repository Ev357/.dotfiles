{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
      "beekeeper-studio-5.2.9"
    ];
  };
}
