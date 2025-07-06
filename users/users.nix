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
        useGlobalPkgs = true;
        useUserPackages = true;
        sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];
        extraSpecialArgs = { inherit inputs; };
        backupFileExtension = "hm-backup";
        users = {
            "santeri" = import ./../users/santeri/home.nix;
            "root" = import ./../users/root/home.nix;
        };
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin.user = "santeri";

    system.stateVersion = "24.11";
}

