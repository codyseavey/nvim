local _lazygit_term

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    direction = 'horizontal',
    shade_terminals = true,
    float_opts = {
      border = 'curved',
    },
  },
  keys = {
    { '<C-\\>', desc = 'Toggle terminal' },
    { '<leader>tf', '<cmd>ToggleTerm direction=float<CR>', desc = '[T]oggle [f]loating terminal' },
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', desc = '[T]oggle [v]ertical terminal' },
    {
      '<leader>tg',
      function()
        -- Cache the lazygit terminal instance so we don't create a new one every toggle
        local Terminal = require('toggleterm.terminal').Terminal
        if not _lazygit_term then
          _lazygit_term = Terminal:new {
            cmd = 'lazygit',
            direction = 'float',
            float_opts = { border = 'curved' },
            on_open = function(term)
              vim.cmd 'startinsert!'
              vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
            end,
          }
        end
        _lazygit_term:toggle()
      end,
      desc = '[T]oggle lazy[g]it',
    },
  },
}
