{inputs, ...}: {
  imports = [
    inputs.nix-amd-ai.nixosModules.default
  ];

  hardware.amd-npu = {
    enableFastFlowLM = true;
    enableImageGen = false;
    enableLemonade = false;
  };
}
