{ config, pkgs, inputs, ... }:

{
  home = {
    stateVersion = "24.11";
    username = "santeri";
    homeDirectory = "/home/santeri";
  };

  programs.home-manager.enable = true;

  xdg.configFile = {
    hypr.source = "${inputs.config-hypr}"; 
    nvim.source = "${inputs.config-nvim}";
  };

  programs.git = {
    enable = true;
    userEmail = "santeri@hetekivi.com";
    userName = "Santeri Hetekivi";
  };
}
