{ pkgs, ... }:

let
  firefox-policies = pkgs.firefox.override {
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
        "toolkit.legacyUserProfileCustomizations.stylesheets" = {
          Value = true;
          Status = "locked";
        };
        "sidebar.revamp" = {
          Value = true;
          Status = "locked";
        };
        "sidebar.verticalTabs" = {
          Value = true;
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
            Name = "Google (No AI)";
            URLTemplate = "https://www.google.com/search?q={searchTerms}&udm=14";
            Method = "GET";
            IconURL = "https://www.google.com/favicon.ico";
            Alias = "@googlenoai";
            Description = "Google Search (No AI)";
            SuggestURLTemplate = "https://www.google.com/complete/search?q={searchTerms}&udm=14";
          }
        ];
        Default = "Google (No AI)";
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
      ];

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
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
      };
    };
  };
in
{
  packages = [
    firefox-policies
    pkgs.pywalfox-native
  ];

  files.".config/mozilla/firefox/profiles.ini".text = ''
    [Profile0]
    Name=default
    IsRelative=1
    Path=default
    Default=1

    [General]
    StartWithLastProfile=1
    Version=2
  '';

  files.".config/mozilla/firefox/default/chrome/userChrome.css".text = ''
    :root {
      --trigger-area:         6px;   /* Invisible space left at top to catch hover */
      --nav-height:          40px;   /* Nav bar expanded height                    */
      --sidebar-strip:       10px;   /* collapsed sidebar width                    */
      --sidebar-expanded:   220px;   /* expanded sidebar width                     */
      --speed:              300ms;
      --ease:               cubic-bezier(0.4, 0, 0.2, 1);
    }

    #toolbar-menubar {
      display: none !important;
    }

    #navigator-toolbox {
      position: absolute !important;
      top: calc(0px - var(--nav-height) + var(--trigger-area)) !important;
      left: 0 !important;
      width: 100% !important;
      z-index: 100 !important;
      transition: top var(--speed) var(--ease) !important;
      
      background-color: var(--lwt-accent-color, var(--toolbar-bgcolor, -moz-Dialog)) !important;
      background-image: var(--lwt-header-image, none) !important;
      
      margin-top: 0 !important;
      margin-bottom: calc(0px - var(--nav-height) - var(--trigger-area)) !important;
    }

    #navigator-toolbox::after {
      content: "";
      position: absolute;

      /* centered like the sidebar marker */
      left: 50%;
      top: calc(100% - 3px);
      transform: translateX(-50%);

      width: 40px;
      height: 2px;
      border-radius: 1px;

      background: color-mix(in srgb, currentColor 35%, transparent);

      transition: opacity var(--speed) var(--ease);
      pointer-events: none;
    }

    #navigator-toolbox:hover,
    #navigator-toolbox:focus-within {
      top: 0 !important;
    }

    #navigator-toolbox:hover::after,
    #navigator-toolbox:focus-within::after {
      opacity: 0 !important;
    }

    #nav-bar {
      height: var(--nav-height) !important;
      min-height: var(--nav-height) !important;
      opacity: 0 !important;
      transition: opacity var(--speed) var(--ease) !important;
      
      background: color-mix(in srgb, currentColor 35%, transparent);
      color: var(--toolbar-color, currentColor) !important;
    }

    #navigator-toolbox:hover #nav-bar,
    #navigator-toolbox:focus-within #nav-bar {
      opacity: 1 !important;
    }

    #TabsToolbar {
      height: 0 !important;
      min-height: 0 !important;
      overflow: hidden !important;
      opacity: 0 !important;
    }

    #sidebar-box,
    #sidebar-main {
      width:     var(--sidebar-strip) !important;
      min-width: var(--sidebar-strip) !important;
      max-width: var(--sidebar-strip) !important;
      overflow: hidden !important;
      opacity: 0.35 !important;
      transition:
        width      var(--speed) var(--ease),
        min-width  var(--speed) var(--ease),
        max-width  var(--speed) var(--ease),
        opacity    var(--speed) var(--ease) !important;
      position: relative !important;
      z-index: 5 !important;
    }

    #sidebar-box:hover,
    #sidebar-main:hover {
      width:     var(--sidebar-expanded) !important;
      min-width: var(--sidebar-expanded) !important;
      max-width: var(--sidebar-expanded) !important;
      opacity: 1 !important;
    }

    #sidebar-box > *,
    #sidebar-main > * {
      min-width: var(--sidebar-expanded) !important;
    }

    #sidebar-box::after,
    #sidebar-main::after {
      content: "";
      position: absolute;
      top: 50%;
      left: 3px;
      transform: translateY(-50%);
      height: 40px;
      width: 2px;
      border-radius: 1px;
      background: color-mix(in srgb, currentColor 35%, transparent);
      transition: opacity var(--speed);
      pointer-events: none;
    }

    #sidebar-box:hover::after,
    #sidebar-main::after {
      opacity: 0;
    }

    #sidebar-splitter {
      display: none !important;
    }

    :root[inFullscreen] #navigator-toolbox,
    :root[inFullscreen] #sidebar-box,
    :root[inFullscreen] #sidebar-main {
      display: none !important;
    }

    #navigator-toolbox:focus-within {
      top: 0 !important;
    }

    #navigator-toolbox:focus-within #nav-bar {
      opacity: 1 !important;
    }

    #navigator-toolbox:focus-within::after {
      opacity: 0 !important;
    }
  '';
}
