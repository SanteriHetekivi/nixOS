# KDE.
{ pkgs, ... }:
{
    imports = [
        ./server/wayland.nix
    ];
    services = {
        desktopManager.plasma6.enable = true;
        displayManager = {
            defaultSession = "plasma";
            sddm = {
                enable = true;
                wayland.enable = true;
            };
        };
    };
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        kdepim-runtime
        konsole
        oxygen
    ];

    system.stateVersion = "24.11";
}

