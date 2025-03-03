# General.
{ ... }:
{
  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
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
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11";
}

