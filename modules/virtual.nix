# Virtualization.
{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  environment.systemPackages = with pkgs; [
    qemu 
    quickemu 
  ];

  system.stateVersion = "24.11";
}

