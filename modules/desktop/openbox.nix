# Configure desktop enviroment.

{ pkgs, ... }:

{
  imports = [
    ./server/xorg.nix
  ];

  services.xserver = {
    enable = true;
    windowManager.openbox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Terminal emulator.
    ghostty
    # System tray.
    tint2
  ];

  system.stateVersion = "24.11";
}
