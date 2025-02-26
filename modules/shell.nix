# Shell configuration.
{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
    };
    users.defaultUserShell = pkgs.zsh;

    system.stateVersion = "24.11";
}

