# Development configuration for Android development. 
{ pkgs, programs, ... }:

{
  environment.systemPackages = with pkgs; [
    android-studio-full
  ];
  nixpkgs.config.android_sdk.accept_license = true;
  users.users.santeri.extraGroups = ["kvm"];
  system.stateVersion = "24.11";
}

