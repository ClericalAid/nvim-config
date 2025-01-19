return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Autocompletion stuff
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    --"hrsh7th/cmp-buffer",
    --"L3MON4D3/LuaSnip",
  },

  config = function()
    local cmp = require("cmp")
    local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("mason").setup()
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
                capabilities = capabilities
            }
        end,
      }
    })
    cmp.setup({
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        --{name = "buffer", keyword_length = 3},
        --{name = "luasnip", keyword_length = 2},
      },
      mapping = {
        ["<C-y>"] = cmp.mapping.confirm({select = true}),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
        ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
        -- control p is used by telescope as well, so we need to do some
        -- checks to ensure it behaves with the LSP autocomplete
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
      },
    })
  end
}

