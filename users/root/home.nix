{ config, pkgs, inputs, ... }:

{
  home = {
    stateVersion = "24.11";
    username = "root";
    homeDirectory = "/root";
  };

  programs.home-manager.enable = true;

  xdg.configFile = {
    nvim.source = "${inputs.config-nvim}";
  };

  programs.git = {
    enable = true;
    userEmail = "santeri@hetekivi.com";
    userName = "Santeri Hetekivi";
  };
}
