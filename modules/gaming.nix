# Gaming services.
{ pkgs, ... }:

{
  imports = [
    # Use CachyOS kernel.
    ./kernel/cachyos.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamemode.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    # Showing FPS other hardware data while gaming.
    mangohud
    # Managing Proton.
    protonup-qt
    # Installing games that Steam and Heroic do not support.
    lutris
    # To bottle Windows games to be used by launcers like Lutris and Heroic.
    bottles
    # Epic Games Store, GOG and other non Steam stores.
    heroic
  ];
}
