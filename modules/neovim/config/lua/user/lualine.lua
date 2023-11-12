require('lualine').setup({
  options = {
    theme = 'catppuccin',
    icons_enabled = true,
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  },
})
