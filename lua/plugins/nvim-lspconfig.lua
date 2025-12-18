-- ================================================================================================
-- TITLE : nvim-lspconfig
-- ABOUT : Quickstart configurations for the built-in Neovim LSP client.
-- LINKS :
--   > github                  : https://github.com/neovim/nvim-lspconfig
--   > mason.nvim (dep)        : https://github.com/mason-org/mason.nvim
--   > efmls-configs-nvim (dep): https://github.com/creativenull/efmls-configs-nvim
--   > cmp-nvim-lsp (dep)      : https://github.com/hrsh7th/cmp-nvim-lsp
-- ================================================================================================

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} }, -- LSP/DAP/Linter installer & manager
        { "mason-org/mason-lspconfig.nvim" }, -- Bridge lspconfig and mason
    },
    config = function()
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "ty",
            },
        })

        -- cmp has lsp capabilities
        local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Set some defaults that should be applied to all servers
        vim.lsp.config('*', {
            capabilities = cmp_capabilities,
        })
    end,
}
