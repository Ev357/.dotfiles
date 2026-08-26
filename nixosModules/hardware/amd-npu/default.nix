{inputs, ...}: {
  imports = [
    ./patch
    inputs.nix-amd-ai.nixosModules.default
  ];

  nixpkgs.overlays = [
    (_: prev: {
      fastflowlm = prev.callPackage ./fastflowlm.nix {
        fastflowlm = prev.fastflowlm;
      };
    })
  ];

  hardware.amd-npu = {
    enableVulkan = true;
    enableLemonade = false;
  };
}
