-- ================================================================================================
-- TITLE : nvim-cmp
-- ABOUT : A completion plugin for neovim coded in Lua.
-- LINKS :
--   > github : https://github.com/hrsh7th/nvim-cmp
--   > lspkind (dep)                      : https://github.com/onsails/lspkind.nvim
--   > luasnip (dep)                      : https://github.com/L3MON4D3/LuaSnip
--   > cmp-path (dep)                     : https://github.com/hrsh7th/cmp-path
--   > cmp-treesitter (dep)               : https://github.com/ray-x/cmp-treesitter
--   > cmp-nvim-lsp-signature-help (dep)  : https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
--   > cmp-nvim-lsp (dep)                 : https://github.com/hrsh7th/cmp-nvim-lsp
--   > cmp-buffer (dep)                   : https://github.com/hrsh7th/cmp-buffer
--   > cmp_luasnip (dep)                  : https://github.com/saadparwaiz1/cmp_luasnip
--   > cmp-pandoc-references (dep)        : https://github.com/jmbuhr/cmp-pandoc-references
--   > cmp-calc (dep)                     : https://github.com/hrsh7th/cmp-calc
--   > cmp-latex-symbols (dep             : https://github.com/kdheepak/cmp-latex-symbols
-- ================================================================================================

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- helpers. icons/tools/etc
            { 'onsails/lspkind-nvim' }, -- VS Code–style pictograms for Neovim completion items
            {
                "L3MON4D3/LuaSnip", -- LuaSnip
                -- follow latest release.
                version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                -- install jsregexp (optional!).
                build = "make install_jsregexp"
            },
            -- sources for completion
            { 'hrsh7th/cmp-path' },
            { 'ray-x/cmp-treesitter' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-buffer' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'jmbuhr/cmp-pandoc-references' },
            { 'hrsh7th/cmp-calc' },
            { 'kdheepak/cmp-latex-symbols' },
        },
        config = function()
            -- pull in some plugins we are going to use/config
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            local lspkind = require "lspkind"
            lspkind.init()

            -- helper functions
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            -- Setup nvim-cmp
            cmp.setup({
                -- mandatory, one needs snippets
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-n>'] = cmp.mapping(function(fallback)
                        if luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                            fallback()
                        end
                    end, { "i", "s" }),
                    ['<C-p>'] = cmp.mapping(function(fallback)
                        if luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    -- ['<c-e>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({
                        select = true,
                    }),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                autocomplete = false,
                formatting = {
                    format = lspkind.cmp_format {
                        with_text = true,
                        menu = {
                            copilot = '[]',
                            luasnip = "[snip]",
                            nvim_lsp = "[LSP]",
                            buffer = "[buf]",
                            path = "[path]",
                            spell = "[spell]",
                            pandoc_references = "[ref]",
                            tags = "[tag]",
                            treesitter = "[TS]",
                            calc = "[calc]",
                            latex_symbols = "[tex]",
                        },
                    },
                },
                sources = {
                    { name = 'path' },
                    { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'nvim_lsp' },
                    { name = 'buffer', keyword_length = 5, max_item_count = 3 },
                    { name = 'luasnip', keyword_length = 3, max_item_count = 3 },
                    { name = 'pandoc_references' },
                    { name = 'calc' },
                    { name = 'latex_symbols' },
                },
                view = {
                    entries = "native",
                },
                window = {
                    documentation = {
                        border = require 'misc.style'.border,
                    },
                },
            })
        end,
    },
}
