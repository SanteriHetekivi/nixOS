# Configure desktop enviroment.
{ pkgs, ... }:
{
  imports = [
    ./server/wayland.nix
  ];

  # Hyprland  
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    # System bar.
    waybar
    # Notification deamon.
    dunst
    # Needed for notification deamon to work.
    libnotify
    # App runner.
    rofi-wayland
  ];

  services.gnome.gnome-keyring.enable = true;
  system.stateVersion = "24.11";
}
