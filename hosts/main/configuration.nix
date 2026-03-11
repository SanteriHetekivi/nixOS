# Main PC.
{ pkgs, ... }:
{
  imports = [
    # Hardware scan results.
    ./hardware-configuration.nix
    # General setup.
    ./../../modules/general.nix
    # Tools for Secure Boot.
    ./../../modules/secure_boot.nix
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
    ./../../modules/desktop/kde.nix
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
    # Android development.
    ./../../modules/development/android.nix
    # Running containers.
    ./../../modules/development/containers.nix
    # Security.
    ./../../modules/security.nix
    # Editors.
    ./../../modules/editor/nvim.nix
    ./../../modules/editor/vscode.nix
    # SSH.
    ./../../modules/ssh.nix
    # Virtualization
    ./../../modules/virtual.nix
    # Printer
    ./../../modules/printer.nix
  ];

  # Hostname.
  networking.hostName = "main";

  # Do not lock the screen when the system resumes from sleep.
  local.users.lockOnResume = false;

  system.stateVersion = "24.11";
}

