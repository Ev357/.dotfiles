{inputs, ...}: {
  imports = [inputs.nix-amd-ai.nixosModules.default];

  hardware.amd-npu = {
    enableVulkan = true;
    enableLemonade = false;
  };
}
