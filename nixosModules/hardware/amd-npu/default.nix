{inputs, ...}: {
  imports = [
    ./patch
    inputs.nix-amd-ai.nixosModules.default
  ];

  hardware.amd-npu = {
    enableVulkan = true;
    enableLemonade = false;
  };
}
