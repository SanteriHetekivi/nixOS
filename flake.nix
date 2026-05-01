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
            url = "github:nix-community/lanzaboote/v1.0.0";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { nixpkgs, lanzaboote,... } @ inputs:
        let
            sharedModules = [
                { nixpkgs.config.allowUnfree = true; }
                # TODO: remove once https://github.com/NixOS/nixpkgs/issues/514113 is fixed
                { nixpkgs.overlays = [
                        (final: prev: {
                            openldap = prev.openldap.overrideAttrs (_: {
                                doCheck = false;
                            });
                        })
                    ];
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
