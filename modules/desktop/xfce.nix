# Configure desktop enviroment.

{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    desktopManager = {
      xfce.enable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # Terminal emulator.
    ghostty
  ];

  system.stateVersion = "24.11";
}
