# Security configuration.
{ pkgs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Password manager.
    # TODO: Uncomment when bitwarden-desktop uses newer electron: https://github.com/NixOS/nixpkgs/issues/526914
    #bitwarden-desktop
    # 2FA
    ente-auth
  ];

  system.stateVersion = "24.11";
}

