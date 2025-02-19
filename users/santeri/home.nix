{ config, pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.11";
    username = "santeri";
    homeDirectory = "/home/santeri";
    file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/nvim";
      ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "santeri@hetekivi.com";
    userName = "Santeri Hetekivi";
  };
}

