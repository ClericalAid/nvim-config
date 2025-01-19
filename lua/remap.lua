vim.g.mapleader = " "
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  end
})

-- vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true })
-- vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true })
