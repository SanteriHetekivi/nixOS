# Xbox Elite 2 controller
{ config, pkgs, ... }:
{
    boot = {
        kernelModules = [
            "hid_microsoft"
        ];
        blacklistedKernelModules = [
            "hid_xpadneo"
        ];
    };

    services.udev.packages = [
        (pkgs.writeTextFile {
         name = "xbox-one-elite-2-udev-rules";
         text = ''KERNEL=="hidraw*", TAG+="uaccess"'';
         destination = "/etc/udev/rules.d/60-xbox-elite-2-hid.rules";
         })
    ];

    system.stateVersion = "24.11";
}

