# Main PC.
{ pkgs, ... }:

{
  imports = [
    # Hardware scan results.
    ./hardware-configuration.nix
    # General setup.
    ./../../modules/general.nix
    # Locale settings.
    ./../../modules/locale.nix
    # NVIDIA settings.
    ./../../modules/nvidia.nix
    # Desktop enviroment.
    ./../../modules/desktop.nix
    # Gaming config.
    ./../../modules/gaming.nix
    # Sosial media and messaging apps.
    ./../../modules/sosial.nix
    # Users.
    ./../../users/users.nix
    # Development tools.
    ./../../modules/dev.nix
    # Security.
    ./../../modules/security.nix
    # Editor.
    ./../../modules/editor.nix
  ];
  
  # Hostname.
  networking.hostName = "main";

  system.stateVersion = "24.11";
}

