# Network. 
{ pkgs, ... }:
{
  # Networking.
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    networkmanager_dmenu
  ];

  system.stateVersion = "24.11";
}

