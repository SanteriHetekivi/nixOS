# Configure Wayland.
{ pkgs, ... }:
{
  # X11 for XWayland to use.
  services.xserver.enable = true;

  # Hint Elecrton apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    # Clipboard for copying and pasting.
    wl-clipboard
  ];

  system.stateVersion = "24.11";
}

