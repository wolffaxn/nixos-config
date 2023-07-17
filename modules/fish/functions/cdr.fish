function cdr -d "cd into the root directory of the current git repository"
    cd (git rev-parse --show-toplevel)
end
