# Main PC.
{ ... }:

{
  imports = [
    # Hardware scan results.
    ./hardware-configuration.nix
    # Locale settings.
    ./locale.nix
    # Display settings.
    ./display.nix
    # Desktop enviroment.
    ./desktop.nix
    # Gaming config.
    ./gaming.nix
    # Sosial media and messaging apps.
    ./sosial.nix
    # Users.
    ./users.nix
    # Development tools.
    ./dev.nix
    # Security.
    ./security.nix
    # Editor.
    ./editor.nix
  ];
  
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking.
  networking = {
    hostName = "main";
    networkmanager.enable = true;
  };
  
  # Allow flakes.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Services.
  services = {
    # Enable CUPS to print documents.
    printing.enable = true;
    # Keyring.
    gnome.gnome-keyring.enable = true;
  };
  
  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}

