REC_DIR="$HOME/Videos"
REC_FILE="$REC_DIR/recording_$(date +'%Y-%m-%d_%H-%M-%S').mp4"

if pgrep -x "wl-screenrec" > /dev/null; then
    SELECTION=$(echo -e "🎨 Color Picker\n✏️ Annotate\n🔤 OCR (Copy Text)\n📷 QR Code Scanner\n🛑 Stop Recording" | fuzzel --dmenu -i -p "Screen Toolkit:")
else
    SELECTION=$(echo -e "🎨 Color Picker\n✏️ Annotate\n🔤 OCR (Copy Text)\n📷 QR Code Scanner\n🎥 Record Silent\n🔊 Record with System Audio\n🎙️ Record with Mic Audio" | fuzzel --dmenu -i -p "Screen Toolkit:")
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
