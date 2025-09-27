# Printer setup.
{ pkgs, ... }:
{
    services.printing.enable = true;
    services.printing.drivers = [ pkgs.hplip ];
    environment.systemPackages = with pkgs; [ hplip ];

    system.stateVersion = "24.11";
}
