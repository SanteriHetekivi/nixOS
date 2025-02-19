# Security configuration.
{ pkgs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Password manager.
    bitwarden-desktop
    # 2FA
    ente-auth
  ];

  system.stateVersion = "24.11";
}

