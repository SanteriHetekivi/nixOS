# Text editor.
{ ... }:

{
  # NeoVIM
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  system.stateVersion = "24.11";
}

