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

    outputs = { nixpkgs, ... } @ inputs: {
        nixosConfigurations = {
            main = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/main/configuration.nix
                    inputs.home-manager.nixosModules.default
                ];
            };
            secondary = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/secondary/configuration.nix
                    inputs.home-manager.nixosModules.default
                ];
            };
            t440s = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/t440s/configuration.nix
                        inputs.home-manager.nixosModules.default
                ];
            };
        };
    };
}
