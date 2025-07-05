# Main PC.
{ pkgs, ... }:

{
  imports = [
    # Hardware scan results.
    ./hardware-configuration.nix
    # General setup.
    ./../../modules/general.nix
    # Network.
    ./../../modules/network.nix
    # Locale settings.
    ./../../modules/locale.nix
    # Automatic updates.
    ./../../modules/update.nix
    # Audio.
    ./../../modules/audio.nix
    # Bluetooth.
    ./../../modules/bluetooth.nix
    # Xbox Elite 2 Controller.
    ./../../modules/device/xbox-elite2.nix
    # Cleanup.
    ./../../modules/clean.nix
    # NVIDIA settings.
    ./../../modules/nvidia.nix
    # Desktop enviroment.
    ./../../modules/desktop/kde6.nix
    # Shell.
    ./../../modules/shell.nix
    # Terminal emulator.
    ./../../modules/terminal.nix
    # Internet browser.
    ./../../modules/browser.nix
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
    # SSH.
    ./../../modules/ssh.nix
    # Virtualization
    ./../../modules/virtual.nix
  ];
  
  # Hostname.
  networking.hostName = "main";

  system.stateVersion = "24.11";
}

