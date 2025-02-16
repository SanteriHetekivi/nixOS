# Development configuration.
{ pkgs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Git repositories.
    git
    # Make scripts.
    gnumake
    # Opening ZIP archives.
    unzip
    # GNU compilers.
    gcc
    # Rust.
    rustup
  ];

  system.stateVersion = "24.11";
}

