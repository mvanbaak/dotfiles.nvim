-- ================================================================================================
-- TITLE : lsp
-- ABOUT : Configuration and enabling of lsp servers in neovim. Uses nvim-lspconfig for quickstart
--         configurations maintained by the community.
--         Seperate server configurations are in lsp/
-- LINKS :
--   > vim.lsp : https://neovim.io/doc/user/lsp.html
-- ================================================================================================

-- enable lsp servers interested for us
vim.lsp.enable({
    "lua_ls",
    "pyright",
})
