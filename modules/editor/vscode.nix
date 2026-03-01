# Visual Studio Code
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Visual Studio Code.
    vscode
  ];

  system.stateVersion = "24.11";
}
