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

-- helper function for jumping to next/prev diagnostic, based on severity
local diagnostic_goto = function(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = next and 1 or -1, float = true, severity = severity })
  end
end

vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "<leader>nd", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>pd", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "<leader>ne", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "<leader>pee", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "<leader>nw", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "<leader>pw", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
