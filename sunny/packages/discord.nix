{ config, lib, pkgs, ... }:

{
  stylix.targets.vencord.enable = false;

  programs.nixcord = {
    enable = true;
    discord = {
      enable = true;
      vencord.enable = true;
    };
    quickCss = ''
    @import url('https://raw.githubusercontent.com/sunworms/D2Coding-Webfont/refs/heads/master/stylesheet.css');

    /* theme config start */
    body {
        --font: 'D2CodingLigature Nerd Font';
        font-weight: 400;
        --code-font: 'D2CodingLigature Nerd Font';
        --border-thickness: 1px;
        --divider-thickness: 2px;
    }
    :root {
        --purple-1: oklch(97% 0.01 265);
        --purple-2: oklch(92% 0.01 265);
        --purple-3: oklch(87% 0.01 265);
        --purple-4: oklch(82% 0.01 265);
        --purple-5: oklch(77% 0.01 265);
    }
    /* theme config end */

    /* reduce context menu padding */
    .scroller_c1e9c4{
        margin: -4px;
        &::after,.separator_c1e9c4 {
            margin: 1px 8px !important;
        }
        &::after,.wrapper_f563df {
            padding: 2px !important;
        }
        &::after,.item_c1e9c4{
            /* min-height is 32px as default, change value for desired look */
            min-height: 32;
            /* padding is 4px 8px as default, change value for desired look */
            padding: 4px 8px;
        }
    }
    '';
    config = {
      disableMinSize = true;
      useQuickCss = true;
      themeLinks = [
        "https://refact0r.github.io/system24/build/system24.css"
        "https://raw.githubusercontent.com/mudrhiod/discord-iconpacks/refs/heads/master/vencord/solar/solar.css"
        "https://raw.githubusercontent.com/mudrhiod/discord-iconpacks/refs/heads/master/vencord/solar/moreicons.css"
      ];
      frameless = true;
      plugins = {
        USRBG.enable = true;
        accountPanelServerProfile.enable = true;
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterRoleContext.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        copyEmojiMarkdown = {
          enable = true;
          copyUnicode = true;
        };
        copyFileContents.enable = true;
        copyStickerLinks.enable = true;
        copyUserURLs.enable = true;
        decor.enable = true;
        disableCallIdle.enable = true;
        expressionCloner.enable = true;
        fakeNitro = {
          enable = true;
          transformCompoundSentence = true;
        };
        fakeProfileThemes.enable = true;
        favoriteGifSearch.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendInvites.enable = true;
        fullSearchContext.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        imageZoom.enable = true;
        ircColors = {
          enable = true;
          applyColorOnlyToUsersWithoutColor = true;
        };
        loadingQuotes.enable = true;
        messageClickActions.enable = true;
        moreCommands.enable = true;
        moreKaomoji.enable = true;
        moreUserTags = {
          enable = true;
          dontShowForBots = true;
        };
        noBlockedMessages.enable = true;
        noReplyMention.enable = true;
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        pauseInvitesForever.enable = true;
        petpet.enable = true;
        pictureInPicture.enable = true;
        platformIndicators.enable = true;
        previewMessage.enable = true;
        quickReply.enable = true;
        reverseImageSearch.enable = true;
        sendTimestamps.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks.enable = true;
        spotifyControls = {
          enable = true;
          useSpotifyUris = true;
        };
        spotifyCrack.enable = true;
        spotifyShareCommands.enable = true;
        stickerPaste.enable = true;
        translate.enable = true;
        unindent.enable = true;
        unlockedAvatarZoom.enable = true;
        unsuppressEmbeds.enable = true;
        userMessagesPronouns.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons = {
          enable = true;
          format = "png";
        };
        viewRaw.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
