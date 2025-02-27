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
    # Automatic updates.
    ./../../modules/update.nix
    # Audio.
    ./../../modules/audio.nix
    # Bluetooth.
    ./../../modules/bluetooth.nix
    # Cleanup.
    ./../../modules/clean.nix
    # Desktop enviroment.
    ./../../modules/desktop/hyprland.nix
    # Shell.
    ./../../modules/shell.nix
    # Terminal emulator.
    ./../../modules/terminal.nix
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
  ];
  
  # Hostname.
  networking.hostName = "t440s";

  system.stateVersion = "24.11";
}

