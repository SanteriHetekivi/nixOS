# Bluetooth.
{ config, ... }:
{
    hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        settings.General = {
            experimental = true;
            Privacy = "device";
            JustWorksRepairing = "always";
            Class = "0x000100";
            FastConnectable = true;
        };
    };
    services.blueman.enable = true;

    system.stateVersion = "24.11";
}

