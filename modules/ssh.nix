# Configure SSH.
{ ... }:
{
    services.openssh = {
        enable = true;
        settings = {
            PasswordAuthentication = false;
            AllowUsers = ["santeri"];
            UseDns = true;
            PermitRootLogin = "no";
        };
    };
    users.users."santeri".openssh.authorizedKeys.keys = [
        # main - santeri
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3GfbeooDAcQKN3293//9F9FbVUTkr6O9LBFEPTk26e"
        # main - root
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP6F8LGcSMfOaXoJdZPMEA6+msPVtV9GTyYuXAppyrAf"
        # secondary - santeri
        #"TODO"
        # secondary - root
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHeB5pinfPGkSKVxPLAqIXevEuJJa4ZrZgBPPjwVCFqc"
        # t440s - santeri
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcvhWR2wUbeg5K/ZEk9ZDy0dQtOCzVcK8jr65DGhk9r"
        # t440s - root
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAtPTyCFF+KKoJKIcHf1eGCqaqisJDYxluSbURsoPH6Y"
    ]; 

    system.stateVersion = "24.11";
}

