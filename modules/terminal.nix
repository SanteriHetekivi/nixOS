# Terminal emulator.
{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        ghostty
    ];

    programs.tmux = {
        enable = true;
        clock24 = true;
    };

    system.stateVersion = "24.11";
}
