# Development configuration for Android development. 
{ pkgs, programs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-tools
    android-studio-full
  ];
  nixpkgs.config.android_sdk.accept_license = true;
  users.users.santeri.extraGroups = ["kvm" "adbusers"];
  system.stateVersion = "24.11";
}

