CATBOX_USERHASH_FILE=@USERHASH_FILE@
CATBOX_USERHASH=""
[[ -f "$CATBOX_USERHASH_FILE" ]] && CATBOX_USERHASH=$(<"$CATBOX_USERHASH_FILE")
REC_DIR="$HOME/Videos"
REC_FILE="$REC_DIR/recording_$(date +'%Y-%m-%d_%H-%M-%S').mp4"

if pgrep -x "wl-screenrec" > /dev/null; then
    SELECTION=$(echo -e "🎨 Color Picker\n✏️ Annotate\n🔤 OCR (Copy Text)\n📷 QR Code Scanner\n🔍 Google Lens Search\n🛑 Stop Recording" | fuzzel --dmenu -i -p "Screen Toolkit:")
else
    SELECTION=$(echo -e "🎨 Color Picker\n✏️ Annotate\n🔤 OCR (Copy Text)\n📷 QR Code Scanner\n🔍 Google Lens Search\n🎥 Record Silent\n🔊 Record with System Audio\n🎙️ Record with Mic Audio" | fuzzel --dmenu -i -p "Screen Toolkit:")
fi

case "$SELECTION" in
    "🎨 Color Picker")
        hyprpicker -a -f hex
        ;;
    "✏️ Annotate")
        grim -g "$(slurp)" - | satty --filename - --fullscreen
        ;;
    "🔤 OCR (Copy Text)")
        grim -g "$(slurp)" /tmp/ocr_tmp.png && \
        tesseract /tmp/ocr_tmp.png stdout 2>/dev/null | wl-copy && \
        notify-send "OCR" "Text copied to clipboard!" && \
        rm /tmp/ocr_tmp.png
        ;;
    "📷 QR Code Scanner")
        grim -g "$(slurp)" - | zbarimg -q --raw - | wl-copy && \
        notify-send "QR Scanner" "Decoded content copied to clipboard!"
        ;;
    "🔍 Google Lens Search")
        notify-send "Google Lens" "Select area to search..."
        TMPIMG="/tmp/lens_$(date +%s).png"
        grim -g "$(slurp)" "$TMPIMG"
        IMG_URL=$(curl -s -F "reqtype=fileupload" -F "fileToUpload=@${TMPIMG};type=image/png" https://catbox.moe/user/api.php)
        rm -f "$TMPIMG"
        if [[ "$IMG_URL" == https://* ]]; then
            ENCODED_URL=$(jq -sRr @uri <<< "$IMG_URL")
            xdg-open "https://lens.google.com/uploadbyurl?url=$ENCODED_URL"
            if [[ -n "$CATBOX_USERHASH" ]]; then
                FILENAME=$(basename "$IMG_URL")
                (sleep 30 && curl -s -F "reqtype=deletefiles" -F "userhash=$CATBOX_USERHASH" -F "files=$FILENAME" https://catbox.moe/user/api.php > /dev/null) &
            fi
        else
            notify-send "Google Lens" "Upload failed: $IMG_URL"
        fi
        ;;
    "🎥 Record Silent")
        mkdir -p "$REC_DIR"
        notify-send "Recording" "Select area to start silent recording..."
        wl-screenrec -g "$(slurp)" -f "$REC_FILE"
        ;;
    "🔊 Record with System Audio")
        mkdir -p "$REC_DIR"
        AUDIO_SOURCE=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -oP 'node.name = "\K[^"]+').monitor
        notify-send "Recording" "Select area (recording desktop audio)..."
        wl-screenrec --audio --audio-device "$AUDIO_SOURCE" -g "$(slurp)" -f "$REC_FILE"
        ;;
    "🎙️ Record with Mic Audio")
        mkdir -p "$REC_DIR"
        MIC_SOURCE=$(wpctl inspect @DEFAULT_AUDIO_SOURCE@ | grep -oP 'node.name = "\K[^"]+')
        notify-send "Recording" "Select area (recording microphone)..."
        wl-screenrec --audio --audio-device "$MIC_SOURCE" -g "$(slurp)" -f "$REC_FILE"
        ;;
    "🛑 Stop Recording")
        pkill -INT wl-screenrec
        notify-send "Recording Saved" "Saved to $REC_DIR"
        ;;
esac
