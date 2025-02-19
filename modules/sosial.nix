# Sosial media and messaging apps.
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Discord.
    (discord.override {
      withVencord = true;
    })
    # Telegram.
    telegram-desktop
    # Signal
    signal-desktop
  ];

  system.stateVersion = "24.11";
}
