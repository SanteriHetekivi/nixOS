{ config, pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.11";
    username = "root";
    homeDirectory = "/root";
    file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/nvim";
    };
  };

  programs.git = {
    enable = true;
    userEmail = "santeri@hetekivi.com";
    userName = "Santeri Hetekivi";
  };
}

