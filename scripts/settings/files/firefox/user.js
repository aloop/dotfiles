// Much of this is adapted from https://github.com/arkenfox/user.js/blob/master/user.js

// Disable warning for about:config
user_pref("browser.aboutConfig.showWarning", false);

// Annoying when using both Default Release and Dev Edition or Nightly
user_pref("browser.shell.checkDefaultBrowser", false);

// Restore the previous session on startup
user_pref("browser.startup.page", 3);

// Don't open links from clipboard when using the middle mouse button
user_pref("middlemouse.contentLoadURL", false);

// Disable paste using middle mouse button
user_pref("middlemouse.paste", false);

// Enable middle mouse button scrolling
user_pref("general.autoScroll", true);

// Don't sort ctrl-tab by recently used
user_pref("browser.ctrlTab.recentlyUsedOrder", false);

// Enable the new tab page
user_pref("browser.newtabpage.enabled", true);
user_pref("browser.newtab.preload", true);

// Set new page preferences
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref(
    "browser.newtabpage.activity-stream.section.highlights.includePocket",
    false
);
user_pref(
    "browser.newtabpage.activity-stream.feeds.discoverystreamfeed",
    false
);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);

// Remove default "top sites"
user_pref("browser.newtabpage.activity-stream.default.sites", "");

// Disable browser region updates
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);

// Set my preferred languages
user_pref("intl.accept_languages", "en-US, en");

// Disable addon recommendations
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);

// Helps prevent spoofed domain names
user_pref("network.IDN_show_punycode", true);

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
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);

// Disable studies
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

// Disable crash reports
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

// Disable safebrowsing for downloads
user_pref("browser.safebrowsing.downloads.remote.enabled", false);

// Disable prefetching
// user_pref("network.prefetch-next", false);
// user_pref("network.dns.disablePrefetch", true);
// Disable link-mouseover opening connection to linked server
user_pref("network.http.speculative-parallel-limit", 0);
// user_pref("browser.places.speculativeConnect.enabled", false);

// Route dns queries through the proxy if a proxy is being used
user_pref("network.proxy.socks_remote_dns", true);

// Disable gvfs/gio protocols
user_pref("network.gio.supported-protocols", "");

// Disable DNS-over-HTTPS
user_pref("network.trr.mode", 5);

// Disable uploading of screenshots
user_pref("extensions.screenshots.upload-disabled", true);

// Don't store credit/debit cards for autofill
user_pref("extensions.formautofill.creditCards.enabled", false);

// Disable location bar search suggestions
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.suggest.searches", false);
// Don't open connections preemptively
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);

// Don't autofill on non-secure HTTP pages
user_pref("signon.autofillForms.http", false);
user_pref("security.insecure_field_warning.contextual.enabled", true);

// * 0 = don't allow sub-resources to open HTTP authentication credentials dialogs
// * 1 = don't allow cross-origin sub-resources to open HTTP authentication credentials dialogs
// * 2 = allow sub-resources to open HTTP authentication credentials dialogs (default)
user_pref("network.auth.subresource-http-auth-allow", 1);

// Don't report SSL errors
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("security.ssl.errorReporting.enabled", false);
user_pref("security.ssl.errorReporting.url", "");

// Harden OCSP settings
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.OCSP.enabled", 1);
user_pref("security.OCSP.require", true);

// Only support SSL/TLS connections with servers which implement RFC 5746
user_pref("security.ssl.require_safe_negotiation", true);

// Disable SHA-1 certs
user_pref("security.pki.sha1_enforcement_level", 1);

user_pref("security.family_safety.mode", 0);
// user_pref("security.cert_pinning.enforcement_level", 2);

/* enable CRLite
 * 0 = disabled
 * 1 = consult CRLite but only collect telemetry (default)
 * 2 = consult CRLite and enforce both "Revoked" and "Not Revoked" results
 * 3 = consult CRLite and enforce "Not Revoked" results, but defer to OCSP for "Revoked" */
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.pki.crlite_mode", 2);

// Don't show HTTP content on HTTPS pages
user_pref("security.mixed_content.block_display_content", true);
// Enable HTTPS-only mode
user_pref("dom.security.https_only_mode", true);

// Show more information on cert errors
user_pref("browser.xul.error_pages.expert_bad_cert", true);

// Send less information in the referer header
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// Enable container tabs
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);

// Disable auto-play for videos with audio
// 0=Allow all, 1=Block non-muted media (default), 5=Block all
user_pref("media.autoplay.default", 1);

// Don't allow accessibility services to access browser
user_pref("accessibility.force_disabled", 1);

// Disable some additional analytics
user_pref("beacon.enabled", false);

// Delete temp files after use
user_pref("browser.helperApps.deleteTempFileOnExit", true);

// Don't generate thumbnails for pages
user_pref("browser.pagethumbnails.capturing_disabled", true);

// Disable UITour
user_pref("browser.uitour.enabled", false);
user_pref("browser.uitour.url", "");

// Ask where to save downloads
user_pref("browser.download.useDownloadDir", false);
// Don't show the download panel after every download
user_pref("browser.download.alwaysOpenPanel", false);
// Don't add downloads to "recent files" type lists
user_pref("browser.download.manager.addToRecentDocs", false);

// Don't allow extensions from outside of the profile/application directories
user_pref("extensions.enabledScopes", 5);
user_pref("extensions.autoDisableScopes", 15);
user_pref("extensions.postDownloadThirdPartyPrompt", false);

// Disable automatic addition of www. and .com to bare domain names
user_pref("browser.fixup.alternate.enabled", false);

user_pref("gfx.webrender.program-binary", true);
user_pref("gfx.webrender.program-binary-disk", true);

user_pref("browser.contentblocking.enabled", true);
user_pref("browser.contentblocking.category", "strict");
// Partition service workers
user_pref("privacy.partition.serviceWorkers", true);
// Enable tracking protection
// user_pref("privacy.trackingprotection.enabled", true);
// user_pref("privacy.trackingprotection.cryptomining.enabled", true);
// user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
// Enable blocking of tracker cookies
// user_pref("network.cookie.cookieBehavior", 4);
// user_pref("network.http.referer.disallowCrossSiteRelaxingDefault", true);

// Don't save cookies set on HTTP between sessions
user_pref("network.cookie.thirdparty.sessionOnly", false);
user_pref("network.cookie.thirdparty.nonsecureSessionOnly", true);

user_pref("privacy.clearOnShutdown.downloads", true);

// Enable RFP (Resist Fingerprinting)
// user_pref("privacy.resistFingerprinting", true);

// Remove some suggestions from the location bar
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);

user_pref("ui.systemUsesDarkTheme", 1);

// Disable autocopy on Linux
user_pref("clipboard.autocopy", false);

// Don't let the backspace navigate to the previous page
user_pref("browser.backspace_action", 2);

user_pref("browser.bookmarks.max_backups", 2);

// Don't recommend features or extensions while browsings
user_pref(
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons",
    false
);
user_pref(
    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features",
    false
);

// Enable GTK overlay scrollbar
user_pref("widget.gtk.overlay-scrollbars.enabled", true);

