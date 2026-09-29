function wal_theme --description "Run pywal with image and backend"
    set -l img $argv[1]
    set -l backend "wal"

    if test (count $argv) -ge 2
        set backend $argv[2]
    end

    if test -z "$img"
        echo "Usage: wal_theme <image_path> [backend]"
        return 1
    end

    wal --backend $backend -o wal-post-hook -a 0.85 -i (eval echo $img)
end
