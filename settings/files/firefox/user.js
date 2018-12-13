// I usually want firefox as the default browser
user_pref("browser.shell.checkDefaultBrowser", true);

// Restore the previous session on startup
user_pref("browser.startup.page", 3);

// Enable middle mouse button scrolling
user_pref("general.autoScroll", true);

// Disable paste using middle mouse button
user_pref("middlemouse.paste", false);

// Set new page preferences
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");
user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.aboutHomeSnippets.updateUrl", "");
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref(
    "browser.newtabpage.activity-stream.section.highlights.includePocket",
    false
);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);

user_pref("browser.contentblocking.enabled", true);

// Helps prevent spoofed domain names
user_pref("network.IDN_show_punycode", true);

user_pref("plugins.enumerable_names", "");

// Enable tracking protection
user_pref("privacy.trackingprotection.enabled", true);

// Disable location tracking
user_pref("permissions.default.geo", 2);
user_pref("geo.enabled", false);
user_pref("geo.wifi.url", "");
user_pref("browser.search.geoip.url", "");

// Disable battery api
user_pref("dom.battery.enabled", false);

// Disable pocket
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.site", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");
user_pref("extensions.pocket.api", "");

// Disable telemetry
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.chrome.errorReporter.enabled", false);
user_pref("browser.chrome.errorReporter.submitUrl", "");
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("extensions.webcompat-reporter.enabled", false);
user_pref("browser.send_pings", false);

// Disable experiments
user_pref("network.allow-experiments", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("app.shield.optoutstudies.enabled", false);

// Disable uploading of screenshots
user_pref("extensions.screenshots.upload-disabled", true);

// Don't store credit/debit cards for autofill
user_pref("extensions.formautofill.creditCards.enabled", false);

// Disable location bar search suggestions
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.userMadeSearchSuggestionsChoice", true);

// Don't autofill on non-secure HTTP pages
user_pref("signon.autofillForms.http", false);
user_pref("security.insecure_field_warning.contextual.enabled", true);

// Don't report SSL errors
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("security.ssl.errorReporting.enabled", false);
user_pref("security.ssl.errorReporting.url", "");

// Harden OCSP settings
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.OCSP.enabled", 1);
user_pref("security.OCSP.require", true);
