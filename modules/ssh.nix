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

  system.stateVersion = "24.11";
}

