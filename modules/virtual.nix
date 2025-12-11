# Virtualization.
{ pkgs, ... }:
{
    virtualisation.libvirtd = {
        enable = true;
        qemu = {
            package = pkgs.qemu_kvm;
            runAsRoot = true;
            swtpm.enable = true;
        };
    };
    programs.virt-manager.enable = true;
    environment.systemPackages = with pkgs; [
        qemu 
        quickemu 
    ];

    system.stateVersion = "24.11";
}

