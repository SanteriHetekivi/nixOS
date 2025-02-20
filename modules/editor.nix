# Text editor.
{ pkgs, ... }:

{
  # NeoVIM
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  environment.systemPackages = with pkgs; [
    # For searching.
    ripgrep
    # For downloading files.
    wget
  ];

  system.stateVersion = "24.11";
}

