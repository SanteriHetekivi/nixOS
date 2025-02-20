# Define users.

{ inputs, ... }:

{
  imports = [
    # Handle user home directories.
    inputs.home-manager.nixosModules.default
  ];
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.santeri = {
    isNormalUser = true;
    description = "Santeri Hetekivi";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "hm-backup";
    users = {
      "santeri" = import ./../users/santeri/home.nix;
      "root" = import ./../users/root/home.nix;
    };
  };
  
  # Dark theme for qt.
  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.user = "santeri";

  system.stateVersion = "24.11";
}
