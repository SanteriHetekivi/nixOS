# KDE.
# Using plasma5, because SteamOS uses it and main reason for this is Steam support.
{ pkgs, ... }:
{
    imports = [
        ./server/xorg.nix
    ];

    services = {
        xserver = {
            enable = true;
            desktopManager.plasma5.enable = true;
        };
        displayManager.sddm.enable = true;
    };

    environment.plasma5.excludePackages = with pkgs.libsForQt5; [
        plasma-browser-integration
        konsole
    ];

    system.stateVersion = "24.11";
}

