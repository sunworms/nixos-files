function nixos
    if test (count $argv) -lt 1
        echo "Usage: nixos <build|test|switch|clean> [hostname]"
        return 1
    end

    set cmd $argv[1]

    switch $cmd
        case build
            if test (count $argv) -lt 2
                echo "Usage: nixos build <hostname>"
                return 1
            end

            set host $argv[2]

            nh os build . -H $host
            or return 1

            nvd diff /run/current-system result

            rm -rf result

        case test
            if test (count $argv) -lt 2
                echo "Usage: nixos test <hostname>"
                return 1
            end

            set host $argv[2]

            nh os test . -H $host

        case switch
            if test (count $argv) -lt 2
                echo "Usage: nixos switch <hostname>"
                return 1
            end

            set host $argv[2]

            nh os switch . -H $host

        case clean
            nh clean all

        case '*'
            echo "Invalid command: $cmd"
            return 1
    end
end
