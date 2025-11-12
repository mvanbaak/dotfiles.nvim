-- ================================================================================================
-- TITLE : diagnostics
-- ABOUT : Native neovim diagnostics configuration
-- ================================================================================================

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
    signs = {
        -- Custom signs in the gutter
        text = {
            [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
            [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
            [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
            [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
        },
        -- Highlight the line number for errors and warnings
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
            [vim.diagnostic.severity.WARN] = 'WarningMsg',
        },
    },
    virtual_text = {
        source = "always",
        prefix = "●",
    },
    severity_sort = true,
    float = {
        source = "always",
    },
})
