{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    config-nvim = {
    	url = "github:SanteriHetekivi/nvim";
	flake = false;
    };
    #hyprland.url = "github:hyprwm/Hyprland";
    config-hypr = {
    	url = "github:SanteriHetekivi/hypr";
	flake = false;
    };
    ghostty.url = "github:ghostty-org/ghostty";
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
    };
  };
}
