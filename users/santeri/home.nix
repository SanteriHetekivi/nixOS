{ config, pkgs, inputs, lockOnResume, ... }:
{
    programs.home-manager.enable = true;

    home = {
        stateVersion = "24.11";
        username = "santeri";
        homeDirectory = "/home/santeri";
        file = {
            ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/nvim";
            ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/hypr";
            ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/waybar";
            ".config/openbox".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/openbox";
            ".config/tint2".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/tint2";
            ".zshenv".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/zsh/.zshenv";
            ".zprofile".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/zsh/.zprofile";
            ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/zsh/.zshrc";
            ".zlogin".source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/config/zsh/.zlogin";
        };
        packages = with pkgs; [
            # For setting dark theme.
            dconf
        ];
    };

    programs.git = {
        enable = true;
        settings.user = {
            email = "santeri@hetekivi.com";
            name = "Santeri Hetekivi";
        };
        # TODO: Add signing.
        signing.format = null;
    };

    # Dark theme.
    dconf = {
        enable = true;
        settings = {
            "org/gnome/desktop/interface" = {
                color-scheme = "prefer-dark";
            };
        };
    };
    gtk = {
        enable = true;
        theme = {
            name = "Adwaita-dark";
            package = pkgs.gnome-themes-extra;
        };
        gtk4.theme = null;
        gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
        gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    # Plasma config with plasma-manager
    programs.plasma = {
        enable = true;
        overrideConfig = true;
        workspace = {
            colorScheme = "BreezeDark";
            lookAndFeel = "org.kde.breezedark.desktop";
            iconTheme = "breeze-dark";
            cursor.theme = "breeze_cursors";
            wallpaperPlainColor = "0,0,0";
        };
        shortcuts = {
            ksmserver.LogOut = "Alt+Shift+E";
            kwin."Window Close" = "Alt+Shift+Q";
            "services/com.mitchellh.ghostty.desktop"._launch = "Alt+Return";
        };
        kscreenlocker = {
            autoLock = false;
            lockOnResume = lockOnResume;
            timeout = 0;
            appearance.wallpaperPlainColor = "0,0,0";
        };
        powerdevil = {
            AC = {
                autoSuspend.action = "nothing";
                dimDisplay.enable = false;
                inhibitLidActionWhenExternalMonitorConnected = true;
                powerProfile = "performance";
                turnOffDisplay.idleTimeout = "never";
            };
            general.pausePlayersOnSuspend = true;
        };
        session = {
            general.askForConfirmationOnLogout = false;
            sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
        };
        kwin = {
            nightLight = {
                enable = true;
                mode = "automatic";
            };
        };
    };

    programs.librewolf = {
        enable = true;
        settings = {
            "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
            "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
            "network.cookie.lifetimePolicy" = 0;
        };
    };
}

