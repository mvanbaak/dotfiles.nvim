-- ================================================================================================
-- TITLE : nvim-cmp
-- ABOUT : A completion plugin for neovim coded in Lua.
-- LINKS :
--   > github : https://github.com/hrsh7th/nvim-cmp
--   > lspkind (dep)                      : https://github.com/onsails/lspkind.nvim
--   > nvim-snippy (dep)                  : https://github.com/dcampos/cmp-snippy
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
            { 'dcampos/cmp-snippy' },
            -- sources for completion
            {
                'dcampos/nvim-snippy',
                dependencies = {
                    { 'honza/vim-snippets' },
                }
            },
            { 'hrsh7th/cmp-path' },
            { 'ray-x/cmp-treesitter' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'hrsh7th/cmp-buffer' },
            { 'jmbuhr/cmp-pandoc-references' },
            { 'hrsh7th/cmp-calc' },
            { 'kdheepak/cmp-latex-symbols' },
        },
        config = function()
            -- pull in some plugins we are going to use/config
            local cmp = require 'cmp'
            local lspkind = require 'lspkind'
            local snippy = require 'snippy'
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
                        snippy.expand_snippet(args.body)
                    end,
                },
                mapping = {
                    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
                    ["<C-n>"] = cmp.mapping(function(fallback)
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
                    ["<C-p>"] = cmp.mapping(function(fallback)
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
                            snippy = "[snip]",
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
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'nvim_lsp' },
                    { name = 'snippy' },
                    { name = 'treesitter', keyword_length = 5, max_item_count = 3 },
                    { name = 'buffer', keyword_length = 5, max_item_count = 3 },
                    { name = 'pandoc_references' },
                    { name = 'calc' },
                    { name = 'latex_symbols' },
                },
                view = {
                    entries = "custom",
                },
                window = {
                    completion = {
                        border = require 'misc.style'.border,
                    },
                    documentation = {
                        border = require 'misc.style'.border,
                    },
                },
                enabled = function()
                    local disabled = false
                    disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
                    disabled = disabled or (vim.fn.reg_recording() ~= '')
                    disabled = disabled or (vim.fn.reg_executing() ~= '')
                    disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
                    return not disabled
                end,
            })
        end,
    },
}
