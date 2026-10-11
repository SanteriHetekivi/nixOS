# Network. 
{ pkgs, ... }:
{
  # Networking.
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    networkmanager_dmenu
  ];
}

