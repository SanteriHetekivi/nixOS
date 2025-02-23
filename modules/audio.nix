# Audio configuration.
{ config, pkgs, inputs, ... }:
{
  security.rtkit.enable = true;
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };
  
  environment.systemPackages = with pkgs; [
    # GUI.
    pavucontrol
  ];

  system.stateVersion = "24.11";
}

