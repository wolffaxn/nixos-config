{
    programs.git = {
        enable = true;
        userName = "Alexander Wolff";
        userEmail = "wolffaxn@gmail.com";
        signing = {
            key = "CC475A552C299D3B";
            signByDefault = true;
        };
        extraConfig = {
            apply = {
                # detect whitespace errors when applying a patch
                whitespace = "warn";
            }; 
            branch = {
                # let the local branch track the remote branch when branching off a remote branch
                autosetupmerge = true;
            };
            core = {
                # default editor for commit messages and other inputs
                editor = "nvim";

                # convert CRLF to LF on commit (on a Linux or Mac system)
                autocrlf = "input";
                safecrlf = true;

                # tell git to be case-senstive
                ignorecase = false;

                # make `git rebase` safer on macos
                # see: <http://www.git-tower.com/blog/make-git-rebase-safe-on-osx/>
                trustctime = false;

                # treat spaces before tabs and all kinds of trailing whitespace as an error
                whitespace = "trailing-space,space-before-tab,indent-with-non-tab,cr-at-eol";
            };
            diff = {
                # use more time to create better diffs
                algorithm = "patience";
                # 'git diff' will use (i)ndex, (w)ork tree, (c)ommit and (o)bject instead of
                # a/b/c/d as prefixes for patches
                mnemonicprefix = true;
                # detect copies as well as renames
                renames = "copies";
                # use vim
                tool = "nvimdiff";
                nvimdiff = { 
                    cmd = ''nvim -d "$LOCAL" "$REMOTE"''; 
                };
            };
            fetch = {
                # delete local references on remotes that have deleted those branches
                prune = true;
                # delete local tags that have been deleted on remote
                pruneTags = true;
            };
            init = {
                # see https://sfconservancy.org/news/2020/jun/23/gitbranchname
                defaultBranch = "main";
            };
            merge = {
                # 3-way diff
                conflictstyle = "diff3";
                # include summaries of merged commits in newly created merge commit messages
                log = true;
                # always show a diffstat at the end of a merge
                stat = true;
                # use vimdiff
                tool = "nvimmerge";
            };
            rerere = {
                # enabling the recording of resolved conflicts
                enabled = true;
            };
        };
    };
}