usage() {
    echo "Usage: wal-theme <image_path> [backend] [cols16]" >&2
    echo "  backend and cols16 are auto-detected, either order, either optional" >&2
    exit 1
}

[ -z "$1" ] && usage

img="$(realpath "$1")"
shift

backend=wal
backend_set=0
cols16_set=0

for arg in "$@"; do
    case "$arg" in
        colorthief|colorz|fast_colorthief|haishoku|modern_colorthief|okthief|schemer2|wal)
            if [ "$backend_set" -eq 1 ]; then
                echo "Backend given twice: $arg" >&2
                exit 1
            fi
            backend="$arg"
            backend_set=1
            ;;
        darken|lighten|dual|foxify-darken|foxify-lighten|foxify-dual)
            if [ "$cols16_set" -eq 1 ]; then
                echo "cols16 method given twice: $arg" >&2
                exit 1
            fi
            cols16="$arg"
            cols16_set=1
            ;;
        *)
            echo "Unknown backend or cols16 method: $arg" >&2
            usage
            ;;
    esac
done

awww img "$img" --transition-type none

set -- wal -n --backend "$backend" -o wal-post-hook -a 85 -i "$img"
[ "$cols16_set" -eq 1 ] && set -- "$@" --cols16 "$cols16"
"$@"
