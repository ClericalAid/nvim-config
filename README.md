# nvim-lua-settings

1. Manually install packer for Neovim (check their github page [here](https://github.com/wbthomason/packer.nvim))
2. In Neovim, run `:PackerInstall` (may need to run more than once)
3. Close and reopen Neovim
4. Run `:PackerCompile`

This is necessary because the config files here use `packer` to manage itself.
So the first install works (when you get it fresh from Github), but subsequent
`packer` commands will have weird behaviour

Config directory for neovim:
`~/.config/nvim`
