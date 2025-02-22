# Configure desktop enviroment.

{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    windowManager.openbox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Terminal emulator.
    ghostty
    # System tray.
    tint2
    # Application launcher.
    rofi
  ];

  system.stateVersion = "24.11";
}
