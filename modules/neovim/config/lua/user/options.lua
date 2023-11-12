--
-- options.lua
-- 

local opt = vim.opt

-- nvim quick reference - see https://neovim.io/doc/user/quickref.html#Q_op

opt.compatible = false

-- startup
opt.shortmess:append 'sI'               -- disable nvim intro

-- general
opt.background = 'dark'                 -- "dark" or "light", used for highlight colors
opt.backspace = { "indent", "eol", "start" } -- how backspace works at start of line
opt.colorcolumn = '80'                  -- columns to highlight
opt.cursorline = true                   -- highlight the screen line of the cursor
opt.foldmethod = 'marker'               -- folding type
opt.laststatus = 2                      -- tells when last window has status lines
opt.linebreak = true                    -- wrap long lines at a blank
opt.list = false                        -- how backspace works at start of line
opt.listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣" -- how backspace works at start of line
opt.number = true                       -- print the line number in front of each line
opt.relativenumber = true               -- show relative line number in front of each line
opt.ruler = true                        -- show cursor line and column in the status line
opt.scrolloff = 4                       -- minimum nr. of lines above and below cursor
opt.showmatch = true                    -- briefly jump to matching bracket if insert one
opt.showmode = false                    -- message on status line to show current mode
opt.signcolumn = 'yes'                  -- when and how to display the sign column
opt.splitbelow = true                   -- new window from split is below the current one
opt.splitright = true                   -- new window is put right of the current one
opt.termguicolors = true

-- backup
opt.backup = false                      -- keep backup file after overwriting a file
opt.swapfile = false                    -- whether to use a swapfile for a buffer
opt.undofile = true                     -- save undo information in a file
opt.undodir = vim.fn.stdpath('data') .. 'undodir' -- where to store undo files

-- buffer
opt.hidden = true                       -- don't unload buffer when it is abandoned
opt.syntax = 'ON'                       -- syntax to be loaded for current buffer

-- filetypes
opt.encoding = 'utf8'                   -- encoding used internally
opt.fileencoding = 'utf8'               -- file encoding for multibyte text

-- mouse
opt.mouse = ""                          -- enable the use of mouse clicks

-- search
opt.hlsearch = true                     -- highlight matches with last search pattern 
opt.ignorecase = true                   -- ignore case in search patterns
opt.incsearch = true                    -- highlight match while typing search pattern
opt.smartcase = true                    -- no ignore case when pattern has uppercase

-- spelling
opt.spell = true                        -- enable spell checking
opt.spelllang = { 'de_de', 'en_us' }    -- language(s) to do spell checking for
opt.spellsuggest = 'fast'               -- method(s) used to suggest spelling corrections

-- tabs, indent
opt.expandtab = true                    -- use spaces when <Tab> is inserted
opt.shiftwidth = 2                      -- number of spaces to use for (auto)indent step
opt.softtabstop = 4                     -- number of spaces that <Tab> uses while editing
opt.tabstop = 4                         -- number of spaces that <Tab> in file uses
