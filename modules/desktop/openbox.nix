# Configure desktop enviroment.
{ pkgs, ... }:
{
    imports = [
        ./server/xorg.nix
    ];

    services = {
        gnome.gnome-keyring.enable = true;     
        xserver = {
            enable = true;
            windowManager.openbox.enable = true;
        }; 
    };

    environment.systemPackages = with pkgs; [
        # System tray.
        tint2
        # Setting display resolutions and refresh rates.
        lxde.lxrandr
    ];

    system.stateVersion = "24.11";
}
