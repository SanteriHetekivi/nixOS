# Development configuration.
{ pkgs, programs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Make scripts.
    gnumake
    # Opening ZIP archives.
    unzip
    # GNU compilers.
    gcc
    # Rust.
    rustup
    # Lua language server for nvim config.
    lua-language-server
  ];
  
  # Version control with git.
  programs.git = {
    enable = true;
    config.init.defaultBranch = "main";
  };

  system.stateVersion = "24.11";
}

