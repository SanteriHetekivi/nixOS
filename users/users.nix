# Define users.
{ config, lib, inputs, ... }:
{   
    imports = [
        # Handle user home directories.
        inputs.home-manager.nixosModules.default
    ];

    options.local.users.lockOnResume = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Whether to lock the screen when the system resumes from sleep. (Default: true)";
    };

    config = {
        users.users.santeri = {
            isNormalUser = true;
            description = "Santeri Hetekivi";
            extraGroups = [ "networkmanager" "wheel" ];
        };
        home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            sharedModules = [ inputs.plasma-manager.homeModules.plasma-manager ];
            extraSpecialArgs = {
                inherit inputs;
                lockOnResume = config.local.users.lockOnResume;
            };
            backupFileExtension = "hm-backup";
            users = {
                "santeri" = import ./../users/santeri/home.nix;
                "root" = import ./../users/root/home.nix;
            };
        };

        # Enable automatic login for the user.
        services.displayManager.autoLogin.user = "santeri";

        system.stateVersion = "24.11";
    };
}
