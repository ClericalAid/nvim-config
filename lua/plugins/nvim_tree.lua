return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      view = {
        relativenumber = true,
        float = {
          enable = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 80,
            height = 40,
            row = 1,
            col = 1,
          },
        },
      },
      help = {
        sort_by = "key",
      },
    } -- require("nvim-tree").setup
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true
    vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
