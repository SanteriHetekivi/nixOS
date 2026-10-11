# Automatic update.
{ ... }:

{
  system.autoUpgrade = {
    enable = true;
    dates = "daily";
  };
}

