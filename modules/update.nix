# Automatic update.
{ ... }:

{
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
  };

  system.stateVersion = "24.11";
}

