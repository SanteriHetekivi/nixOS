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
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA3GfbeooDAcQKN3293//9F9FbVUTkr6O9LBFEPTk26e santeri@main.lan"
        # main - root
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP6F8LGcSMfOaXoJdZPMEA6+msPVtV9GTyYuXAppyrAf root@main.lan"
        # secondary - santeri
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFjP4+fJ9firJ3u+Hc0579Bc5DlodGtn6xBKMD3iG9vj santeri@secondary.lan"
        # secondary - root
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHeB5pinfPGkSKVxPLAqIXevEuJJa4ZrZgBPPjwVCFqc root@secondary.lan"
        # t440s - santeri
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMcvhWR2wUbeg5K/ZEk9ZDy0dQtOCzVcK8jr65DGhk9r santeri@t440s.lan"
        # t440s - root
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAtPTyCFF+KKoJKIcHf1eGCqaqisJDYxluSbURsoPH6Y root@t440s.lan"
        # pixel6a - santeri
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILE73KN1ehnpoZIV7Npd/B25Bc97BYjouHEOz1bcrUUJ santeri@pixel6a.lan"
    ]; 

    system.stateVersion = "24.11";
}

