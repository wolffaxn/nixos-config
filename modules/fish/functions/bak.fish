function bak -d "create backup file"
    if not test -f $argv
        echo "File not found: $argv"
        return 0
    end

    set -l filename $argv[1]
    cp $filename $filename"_"(date +%Y%m%d_%H%M%S)".bak"
end
