{
    description = "Base flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
    };
    outputs = { nixpkgs, ... } @ inputs:
        let
            sharedModules = [
                { nixpkgs.config.allowUnfree = true; }
                inputs.home-manager.nixosModules.default
            ];
        in {
            nixosConfigurations = {
                main = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = sharedModules ++ [ ./hosts/main/configuration.nix ];
                };
                secondary = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = sharedModules ++ [ ./hosts/secondary/configuration.nix ];
                };
                t440s = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = sharedModules ++ [ ./hosts/t440s/configuration.nix ];
                };
            };
        };
}
