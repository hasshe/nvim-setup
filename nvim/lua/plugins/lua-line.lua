-- Set line color theme at the bottom of terminal
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
      }
    })
  end
}
