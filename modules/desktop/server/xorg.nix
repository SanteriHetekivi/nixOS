# Configure desktop enviroment.

{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];
  };

  environment.systemPackages = with pkgs; [
    # Application launcher.
    rofi
  ];

  system.stateVersion = "24.11";
}
