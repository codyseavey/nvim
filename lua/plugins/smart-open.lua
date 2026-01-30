return {
  'danielfalk/smart-open.nvim',
  branch = '0.2.x',
  dependencies = {
    'kkharji/sqlite.lua',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  -- Extension is loaded via telescope.lua config (pcall load_extension)
}
