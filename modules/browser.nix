# Internet browser.
{ pkgs, ... }:
{
    programs.firefox = {
        enable = true;
        package = pkgs.librewolf;
        policies = {
            DisableTelemetry = true;
            DisableFirefoxStudies = true;
            Preferences = {
                "cookiebanners.service.mode.privateBrowsing" = 1;
                "cookiebanners.service.mode" = 1;
                "privacy.donottrackheader.enabled" = true;
                "privacy.fingerprintingProtection" = true;
                "privacy.resistFingerprinting" = true;
                "privacy.trackingprotection.emailtracking.enabled" = true;
                "privacy.trackingprotection.enabled" = true;
                "privacy.trackingprotection.fingerprinting.enabled" = true;
                "privacy.trackingprotection.socialtracking.enabled" = true;
            };
            ExtensionSettings = {
                "jid1-ZAdIEUB7XOzOJw@jetpack" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
                    installation_mode = "force_installed";
                };
                "uBlock0@raymondhill.net" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                    installation_mode = "force_installed";
                };
                "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/file/4410896/bitwarden_password_manager-2024.12.4.xpi";
                    installation_mode = "force_installed";
                };
                "sponsorBlocker@ajay.app" = {
                    install_url = "https://addons.mozilla.org/firefox/downloads/file/4424639/sponsorblock-5.11.5.xpi";
                    installation_mode = "force_installed";
                };
            };
        };
    };

    system.stateVersion = "24.11";
}

