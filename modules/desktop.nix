# Configure desktop enviroment.

{ pkgs, ... }:

{
  # X11 for XWayland to use.
  services.xserver.enable = true;

  # Hint Elecrton apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Hyprland  
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # set the flake package
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    #portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # Terminal emulator.
    ghostty
    # System bar.
    waybar
    # Notification deamon.
    dunst
    # Needed for notification deamon to work.
    libnotify
    # Clipboard for copying and pasting.
    wl-clipboard
    # App runner.
    rofi-wayland
  ];

  system.stateVersion = "24.11";
}
