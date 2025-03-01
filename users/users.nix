# Define users.
{ inputs, ... }:
{
    imports = [
        # Handle user home directories.
        inputs.home-manager.nixosModules.default
    ];

    users.users.santeri = {
        isNormalUser = true;
        description = "Santeri Hetekivi";
        extraGroups = [ "networkmanager" "wheel" ];
    };
    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        backupFileExtension = "hm-backup";
        users = {
            "santeri" = import ./../users/santeri/home.nix;
            "root" = import ./../users/root/home.nix;
        };
    };

    # Dark theme for qt.
    qt = {
        enable = true;
        platformTheme = "gnome";
        style = "adwaita-dark";
    };
    environment.etc = { 
        "gtk-2.0/gtkrc".text = ''
            gtk-application-prefer-dark-theme=1
        '';
        "xdg/gtk-3.0/settings.ini".text = ''
            [Settings]
            gtk-application-prefer-dark-theme=1
        '';
        "xdg/gtk-4.0/settings.ini".text = ''
            [Settings]
            gtk-application-prefer-dark-theme=1
        '';
    };
    # Enable automatic login for the user.
    services.displayManager.autoLogin.user = "santeri";

    system.stateVersion = "24.11";
}

