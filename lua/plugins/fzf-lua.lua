-- ================================================================================================
-- TITLE : fzf-lua
-- ABOUT : lua-based fzf wrapper and integration.
-- LINKS :
--   > github : https://github.com/ibhagwan/fzf-lua
-- ================================================================================================

return {
	"ibhagwan/fzf-lua",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "FZF [F]ind [F]iles",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "FZF [F]ind Live [G]rep",
		},
        {
            "<leader>fc",
            function()
                require("fzf-lua").git_commits()
            end,
            desc = "FZF [F]ind [C]ommits"
        },
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "FZF [F]ind [B]uffers",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "FZF [F]ind [H]elp Tags",
		},
		{
			"<leader>fx",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "FZF [F]ind Diagnostics Document",
		},
		{
			"<leader>fX",
			function()
				require("fzf-lua").diagnostics_workspace()
			end,
			desc = "FZF [F]ind Diagnostics Workspace",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols()
			end,
			desc = "FZF [F]ind Document [S]ymbols",
		},
		{
			"<leader>fS",
			function()
				require("fzf-lua").lsp_workspace_symbols()
			end,
			desc = "FZF [F]ind Workspace [S]ymbols",
        },
        {
            "<Leader>fd",
            function()
                require("fzf-lua").lsp_definitions()
            end,
            desc = "FZF [F]ind [D]edfinitions",
        },
        {
            "<Leader>fr",
            function()
                require("fzf-lua").lsp_references()
            end,
            desc = "FZF [F]ind [R]eferences",
        },
},
	opts = {},
}
