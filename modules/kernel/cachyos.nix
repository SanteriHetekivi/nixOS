{ inputs, lib, pkgs, ... }: {
  # Inject CachyOS kernel packages.
  nixpkgs.overlays = [
    # pinned: Use exaclty the same nixpkgs revision that cachyos kernels use to guarantee binary cache hit.
    inputs.nix-cachyos-kernel.overlays.pinned
  ];

  # Use generic CachyOS kernel with BORE scheduler as a fallback if not one defined for host.
  boot.kernelPackages = lib.mkDefault pkgs.cachyosKernels.linuxPackages-cachyos-bore;
}
