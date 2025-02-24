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
    # Setting display resolutions and refresh rates.
    lxde.lxrandr
  ];

  system.stateVersion = "24.11";
}
