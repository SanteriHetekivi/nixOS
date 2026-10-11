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
        lanzaboote = {
            url = "github:nix-community/lanzaboote/v1.2.0";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # Pre build CachyOS kernels for gaming peformance.
        nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    };
    outputs = { nixpkgs, nix, lanzaboote,... } @ inputs:
        let
            sharedModules = [
                {
                    nixpkgs.config.allowUnfree = true;
                    nix.settings = {
                        # Setup to use binary cache for CachyOS kernels.
                        substituters = [ "https://attic.xuyh0120.win/lantian" ];
                        trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
                    };
                }
                inputs.home-manager.nixosModules.default
            ];
        in {
            nixosConfigurations = {
                main = nixpkgs.lib.nixosSystem {
                    specialArgs = { inherit inputs; };
                    modules = sharedModules ++ [
                        lanzaboote.nixosModules.lanzaboote
                        ./hosts/main/configuration.nix
                    ];
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
