# Internet browser.
{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        package = pkgs.librewolf;
        policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            DisablePocket = true;
            DisableFirefoxAccounts = true;
            DisplayBookmarksToolbar = "newtab";
            DisplayMenuBar = "default-off";
            SearchBar = "unified";
            Preferences = {
                "ui.systemUsesDarkTheme" = 1;
                "browser.translations.neverTranslateLanguages" = "fi,en";
                ## Enable DRM content.
                "media.eme.enabled" = true;
                "media.gmp-widevinecdm.enabled" = true;
            };
            ExtensionSettings = {
                "jid1-ZAdIEUB7XOzOJw@jetpack" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
                    installation_mode = "force_installed";
                    default_area = "menupanel";
                };
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                    default_area = "menupanel";
                };
                "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/file/4410896/bitwarden_password_manager-2024.12.4.xpi";
                    installation_mode = "force_installed";
                    default_area = "navbar";
                };
                "sponsorBlocker@ajay.app" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/file/4424639/sponsorblock-5.11.5.xpi";
                    installation_mode = "force_installed";
                    default_area = "menupanel";
                };
            };
        };
    };

    system.stateVersion = "24.11";
}

