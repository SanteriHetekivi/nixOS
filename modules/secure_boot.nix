# Secure Boot.
{ pkgs, lib, ... }:
{
    environment.systemPackages = with pkgs; [
        # Secure Boot Manager - For generating keys.
        sbctl
    ];

    # Replace systemd-boot with Lanzaboote.
    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
    };

    system.stateVersion = "24.11";
}

