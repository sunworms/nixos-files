{ pkgs, ... }:

let
  firefox-devedition-policies = pkgs.firefox-devedition.override {
    extraPolicies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      Preferences = {
        "media.rdd-process.enabled" = {
          Value = false;
          Status = "locked";
        };
        "toolkit.legacyUserProfileCustomizations.stylesheets" = {
          Value = true;
          Status = "locked";
        };
        "xpinstall.signatures.required" = {
          Value = false;
          Status = "locked";
        };
        "browser.ml.enable" = {
          Value = false;
          Status = "locked";
        };
        "browser.ai.control.default" = {
          Value = "blocked";
          Status = "locked";
        };
        "browser.ai.control.sidebarChatbot" = {
          Value = "blocked";
          Status = "locked";
        };
        "browser.ml.chat.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.ml.chat.sidebar" = {
          Value = false;
          Status = "locked";
        };
        "browser.ml.chat.menu" = {
          Value = false;
          Status = "locked";
        };
        "browser.ml.chat.page" = {
          Value = false;
          Status = "locked";
        };
        "extensions.ml.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.ai.control.linkPreviewKeyPoints" = {
          Value = "blocked";
          Status = "locked";
        };
        "browser.ml.linkPreview.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.ml.pageAssist.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.ml.smartAssist.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.ai.control.smartTabGroups" = {
          Value = "blocked";
          Status = "locked";
        };
        "browser.tabs.groups.smart.enabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.tabs.groups.smart.userEnabled" = {
          Value = false;
          Status = "locked";
        };
        "browser.ai.control.translations" = {
          Value = "blocked";
          Status = "locked";
        };
        "browser.ai.control.pdfjsAltText" = {
          Value = "blocked";
          Status = "locked";
        };
        "pdfjs.enableAltTextModelDownload" = {
          Value = false;
          Status = "locked";
        };
        "pdfjs.enableGuessAltText" = {
          Value = false;
          Status = "locked";
        };
      };
      SearchEngines = {
        Add = [
          {
            Name = "DuckDuckGo (No AI)";
            URLTemplate = "https://noai.duckduckgo.com/search?q={searchTerms}";
            Method = "GET";
            IconURL = "https://noai.duckduckgo.com/favicon.ico";
            Alias = "@ddgnoai";
            Description = "DuckDuckGo Search (No AI)";
            SuggestURLTemplate = "https://noai.duckduckgo.com/suggestions?q={searchTerms}";
          }
        ];
        Default = "DuckDuckGo (No AI)";
        PreventInstalls = false;
      };

      Homepage = {
        URL = "about:newtab";
        Locked = true;
      };

      ManagedBookmarks = [
        {
          name = "NixOS stuff";
          children = [
            {
              name = "NixOS Manual";
              url = "https://nixos.org/manual/nixos/unstable";
            }
            {
              name = "Nixpkgs Manual";
              url = "https://nixos.org/manual/nixpkgs/unstable";
            }
            {
              name = "NixOS Packages";
              url = "https://search.nixos.org";
            }
            {
              name = "Flake compat example";
              url = "https://github.com/xieby1/nix_config/blob/a0eb2646b8b3b4a254cac91bada4535f6ebfe979/scripts/pkgs/nvchad.nix";
            }
          ];
        }
        {
          name = "Latex/Typst";
          children = [
            {
              name = "Latex to typst cheat sheet";
              url = "https://qwinsi.github.io/tex2typst-webapp/cheat-sheet.html";
            }
            {
              name = "Latex tables";
              url = "https://www.latex-tables.com";
            }
            {
              name = "Typst symbols";
              url = "https://typst.app/docs/reference/symbols/sym";
            }
          ];
        }
        {
          name = "Development";
          children = [
            {
              name = "GitHub";
              url = "https://github.com";
            }
            {
              name = "git.gay";
              url = "https://git.gay";
            }
          ];
        }
        {
          name = "SearXNG instances";
          children = [
            {
              name = "SearX space";
              url = "https://searx.space/";
            }
          ];
        }
      ];

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          private_browsing = true;
        };

        "addon@darkreader.org" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
          private_browsing = true;
        };

        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
        };

        "sponsorBlocker@ajay.app" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };

        "vpn@proton.ch" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/proton-vpn-firefox-extension/latest.xpi";
        };

        "pywalfox@frewacom.org" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/pywalfox/latest.xpi";
        };

        "vencord-firefox@vendicated.dev" = {
          installation_mode = "normal_installed";
          install_url = "https://github.com/Vendicated/Vencord/releases/download/devbuild/extension-firefox.zip";
        };
      };
    };
  };
in
{
  packages = [
    firefox-devedition-policies
    pkgs.pywalfox-native
  ];
}
