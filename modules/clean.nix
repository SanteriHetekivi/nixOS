# Automatic cleanup.
{ ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
    settings.auto-optimise-store = true;
  };

  system.stateVersion = "24.11";
}

