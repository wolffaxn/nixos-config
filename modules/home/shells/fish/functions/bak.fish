function bak -d "create backup file"
    if not test -f $argv
        echo (set_color red) "File not found: $argv" >&2
        return 1
    end

    set -l filename $argv[1]
    cp $filename $filename"_"(date +%Y%m%d_%H%M%S)".bak"
end
