{ lib, config, pkgs, inputs, ... }: with lib; {
  options = {
    evan.programs.firefox = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable the Firefox browser?";
      };
      
      defaultBrowser = mkOption {
        type = types.bool;
        default = true;
        description = "Set Firefox as the default browser?";
      };
      
      extensions = mkOption {
        type = types.listOf types.str;
        default = [];
        description = "List of Firefox extension IDs to install.";
      };
      
      settings = mkOption {
        type = types.attrsOf types.anything;
        default = {};
        description = "Set preferences in about:config?";
      };
      
      hardened = mkOption {
        type = types.bool;
        default = false;
        description = "Use hardened settings?";
      };

      nsagoaway = mkOption {
	type = types.bool;
	default = false;
	description = "Use *really* hardened settings (makes a new profile)?";
      };
    };
  };
  
  config = mkIf config.evan.programs.firefox.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;
      
      profiles.default = {
        id = 0;
        isDefault = true;
        
        settings = mkMerge [
          (mkIf config.evan.programs.firefox.hardened {
            "content.notify.interval" = 100000;
            "gfx.canvas.accelerated.cache-size" = 512;
            "gfx.content.skia-font-cache-size" = 20;
            "browser.cache.disk.enable" = false;
            "media.memory_cache_max_size" = 65536;
            "media.cache_readahead_limit" = 7200;
            "media.cache_resume_threshold" = 3600;
            "image.mem.decode_bytes_at_a_time" = 32768;
            "network.http.max-connections" = 1800;
            "network.http.max-persistent-connections-per-server" = 10;
            "network.http.max-urgent-start-excessive-connections-per-host" = 5;
            "network.http.pacing.requests.enabled" = false;
            "network.dnsCacheExpiration" = 3600;
            "network.ssl_tokens_cache_capacity" = 10240;
            "network.dns.disablePrefetch" = true;
            "network.dns.disablePrefetchFromHTTPS" = true;
            "network.prefetch-next" = false;
            "network.predictor.enabled" = false;
            "network.predictor.enable-prefetch" = false;
            "layout.css.grid-template-masonry-value.enabled" = true;
            "browser.contentblocking.category" = "strict";
            "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
            "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
            "browser.download.start_downloads_in_tmp_dir" = true;
            "browser.helperApps.deleteTempFileOnExit" = true;
            "browser.uitour.enabled" = false;
            "privacy.globalprivacycontrol.enabled" = true;
            "security.OCSP.enabled" = 0;
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;
            "security.ssl.treat_unsafe_negotiation_as_broken" = true;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "security.tls.enable_0rtt_data" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "browser.sessionstore.interval" = 60000;
            "browser.privatebrowsing.resetPBM.enabled" = true;
            "privacy.history.custom" = true;
            "browser.urlbar.trimHttps" = true;
            "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
            "browser.search.separatePrivateDefault.ui.enabled" = true;
            "browser.urlbar.update2.engineAliasRefresh" = true;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.quicksuggest.enabled" = false;
            "browser.urlbar.groupLabels.enabled" = false;
            "browser.formfill.enable" = false;
            "security.insecure_connection_text.enabled" = true;
            "security.insecure_connection_text.pbmode.enabled" = true;
            "network.IDN_show_punycode" = true;
            "dom.security.https_first" = true;
            "signon.formlessCapture.enabled" = false;
            "signon.privateBrowsingCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;
            "editor.truncate_user_pastes" = false;
            "security.mixed_content.block_display_content" = true;
            "pdfjs.enableScripting" = false;
            "extensions.enabledScopes" = 5;
            "network.http.referer.XOriginTrimmingPolicy" = 2;
            "privacy.userContext.ui.enabled" = true;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "permissions.default.desktop-notification" = 2;
            "permissions.default.geo" = 2;
            "browser.search.update" = false;
            "permissions.manager.defaultsUrl" = "";
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;
            "browser.privatebrowsing.vpnpromourl" = "";
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;
            "browser.shell.checkDefaultBrowser" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
            "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
            "browser.preferences.moreFromMozilla" = false;
            "browser.aboutConfig.showWarning" = false;
            "browser.aboutwelcome.enabled" = false;
            "browser.profiles.enabled" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.compactmode.show" = true;
            "browser.privateWindowSeparation.enabled" = false;
            "cookiebanners.service.mode" = 1;
            "cookiebanners.service.mode.privateBrowsing" = 1;
            "full-screen-api.transition-duration.enter" = "0 0";
            "full-screen-api.transition-duration.leave" = "0 0";
            "full-screen-api.warning.timeout" = 0;
            "browser.urlbar.suggest.calculator" = true;
            "browser.urlbar.unitConversion.enabled" = true;
            "browser.urlbar.trending.featureGate" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.showWeather" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "extensions.pocket.enabled" = false;
            "browser.download.manager.addToRecentDocs" = false;
            "browser.download.open_pdf_attachments_inline" = true;
            "browser.bookmarks.openInTabClosesMenu" = false;
            "browser.menu.showViewImageInfo" = true;
            "findbar.highlightAll" = true;
            "layout.word_select.eat_space_to_next_word" = false;
          })
          config.evan.programs.firefox.settings
        ];
	extensions.packages = map (id: inputs.firefox-addons.packages.${pkgs.system}.${id}) 
	  config.evan.programs.firefox.extensions;                                          
	};

	profiles.nsagoaway = mkIf config.evan.programs.firefox.nsagoaway {
          id = 1;
          isDefault = false;
        
          settings = {
	    "browser.urlbar.speculativeConnect.enabled" = false;
	    "browser.urlbar.quicksuggest.enabled" = false;
	    "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
	    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
	    "browser.search.suggest.enabled" = false;
	    "browser.urlbar.suggest.searches" = false;
	    "browser.urlbar.trending.featureGate" = false;
	    "browser.urlbar.addons.featureGate" = false;
	    "browser.urlbar.fakespot.featureGate" = false;
	    "browser.urlbar.mdn.featureGate" = false;
	    "browser.urlbar.pocket.featureGate" = false;
	    "browser.urlbar.weather.featureGate" = false;
	    "browser.urlbar.yelp.featureGate" = false;
	    "browser.formfill.enable" = false;
	    "browser.search.separatePrivateDefault" = true;
	    "browser.search.separatePrivateDefault.ui.enabled" = true;
	    "signon.autofillForms" = false;
	    "signon.formlessCapture.enabled" = false;
	    "network.auth.subresource-http-auth-allow" = 1;
	    "browser.cache.disk.enable" = false;
	    "browser.privatebrowsing.forceMediaMemoryCache" = true;
	    "media.memory_cache_max_size" = 65536;
	    "browser.sessionstore.privacy_level" = 2;
	    "toolkit.winRegisterApplicationRestart" = false;
	    "browser.shell.shortcutFavicons" = false;
	    "security.ssl.require_safe_negotiation" = true;
	    "security.tls.enable_0rtt_data" = false;
	    "security.OCSP.enabled" = 1;
	    "security.OCSP.require" = true;
	    "security.cert_pinning.enforcement_level" = 2;
	    "security.remote_settings.crlite_filters.enabled" = true;
	    "security.pki.crlite_mode" = 2;
	    "dom.security.https_only_mode" = true;
	    "dom.security.https_only_mode_send_http_background_request" = false;
	    "security.ssl.treat_unsafe_negotiation_as_broken" = true;
	    "browser.xul.error_pages.expert_bad_cert" = true;
	    "network.http.referer.XOriginTrimmingPolicy" = 2;
	    "privacy.userContext.enabled" = true;
	    "privacy.userContext.ui.enabled" = true;
	    "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
	    "media.peerconnection.ice.default_address_only" = true;
	    "dom.disable_window_move_resize" = true;
	    "browser.download.start_downloads_in_tmp_dir" = true;
	    "browser.helperApps.deleteTempFileOnExit" = true;
	    "browser.uitour.enabled" = false;
	    "devtools.debugger.remote-enabled" = false;
	    "permissions.manager.defaultsUrl" = "";
	    "network.IDN_show_punycode" = true;
	    "pdfjs.disabled" = false;
	    "pdfjs.enableScripting" = false;
	    "browser.tabs.searchclipboardfor.middleclick" = false;
	    "browser.contentanalysis.enabled" = false;
	    "browser.contentanalysis.default_result" = 0;
	    "browser.download.useDownloadDir" = false;
	    "browser.download.alwaysOpenPanel" = false;
	    "browser.download.manager.addToRecentDocs" = false;
	    "browser.download.always_ask_before_handling_new_types" = true;
	    "extensions.enabledScopes" = 5;
	    "extensions.postDownloadThirdPartyPrompt" = false;
	    "browser.contentblocking.category" = "strict";
	    "privacy.sanitize.sanitizeOnShutdown" = true;
	    "privacy.clearOnShutdown_v2.cache" = true;
	    "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
	    "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
	    "privacy.clearOnShutdown_v2.downloads" = true;
	    "privacy.clearOnShutdown_v2.formdata" = true;
	    "privacy.clearOnShutdown_v2.cookiesAndStorage" = true;
	    "privacy.clearSiteData.cache" = true;
	    "privacy.clearSiteData.cookiesAndStorage" = false;
	    "privacy.clearSiteData.historyFormDataAndDownloads" = true;
	    "privacy.clearSiteData.browsingHistoryAndDownloads" = true;
	    "privacy.clearSiteData.formdata" = true;
	    "privacy.clearHistory.cache" = true;
	    "privacy.clearHistory.cookiesAndStorage" = false;
	    "privacy.clearHistory.historyFormDataAndDownloads" = true;
	    "privacy.clearHistory.browsingHistoryAndDownloads" = true;
	    "privacy.clearHistory.formdata" = true;
	    "privacy.sanitize.timeSpan" = 0;
	    "privacy.window.maxInnerWidth" = 1600;
	    "privacy.window.maxInnerHeight" = 900;
	    "privacy.resistFingerprinting" = true;
	    "privacy.resistFingerprinting.pbmode" = true;
	    "privacy.resistFingerprinting.block_mozAddonManager" = true;
	    "privacy.resistFingerprinting.letterboxing" = true;
	    "privacy.spoof_english" = 1;
	    "browser.display.use_system_colors" = false;
	    "widget.non-native-theme.use-theme-accent" = false;
	    "browser.link.open_newwindow" = 3;
	    "browser.link.open_newwindow.restriction" = 0;
	    "extensions.blocklist.enabled" = true;
	    "network.http.referer.spoofSource" = false;
	    "security.dialog_enable_delay" = 1000;
	    "privacy.firstparty.isolate" = false;
	    "extensions.webcompat.enable_shims" = true;
	    "security.tls.version.enable-deprecated" = false;
	    "extensions.webcompat-reporter.enabled" = false;
	    "extensions.quarantinedDomains.enabled" = true;
	    "datareporting.policy.dataSubmissionEnabled" = false;
	    "datareporting.healthreport.uploadEnabled" = false;
	    "toolkit.telemetry.unified" = false;
	    "toolkit.telemetry.enabled" = false;
	    "toolkit.telemetry.server" = "data:,";
	    "toolkit.telemetry.archive.enabled" = false;
	    "toolkit.telemetry.newProfilePing.enabled" = false;
	    "toolkit.telemetry.shutdownPingSender.enabled" = false;
	    "toolkit.telemetry.updatePing.enabled" = false;
	    "toolkit.telemetry.bhrPing.enabled" = false;
	    "toolkit.telemetry.firstShutdownPing.enabled" = false;
	    "toolkit.telemetry.coverage.opt-out" = true;
	    "toolkit.coverage.opt-out" = true;
	    "toolkit.coverage.endpoint.base" = "";
	    "browser.startup.homepage_override.mstone" = "ignore";
	    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
	    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
	    "browser.urlbar.showSearchTerms.enabled" = false;
	    "_user.js.parrot" = "SUCCESS: No no he's not dead, he's, he's restin'!";
          };

        extensions.packages = map (id: inputs.firefox-addons.packages.${pkgs.system}.${id}) 
          config.evan.programs.firefox.extensions;
      };
    };
    
    xdg.mimeApps.defaultApplications = mkIf config.evan.programs.firefox.defaultBrowser {
      "text/html" = "firefox.desktop";
      "text/xml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "application/vnd.mozilla.xul+xml" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/ftp" = "firefox.desktop";
    };
  };
}
