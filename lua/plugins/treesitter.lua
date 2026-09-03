return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "c", "lua", "vim", "vimdoc", "javascript", "typescript", "ruby",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then return end
        if lang == "c" or lang == "rust" then return end

        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then return end

        pcall(vim.treesitter.start, buf, lang)
      end,
    })
  end,
}
