## Summary

Add `MeanderingProgrammer/render-markdown.nvim` to the Neovim configuration as a new `lazy.nvim` plugin spec in `lua/plugins/render-markdown.lua`, following the existing plugin file format and header style used across the repository.

The configuration should stay minimal, reuse the existing `nvim-web-devicons` dependency, enable the plugin's in-process LSP completions for compatibility with the current `nvim-cmp` setup, and lazy-load for a small set of markdown-like filetypes.

## Current Context

The repository stores plugin definitions as individual Lua files under `lua/plugins/`. Each file starts with a documentation header containing `TITLE`, `ABOUT`, and `LINKS`, then returns a single plugin spec table.

Relevant existing patterns:

- `lua/plugins/nvim-tree.lua` shows the preferred style for a small plugin spec with `dependencies`, `cmd` or `keys`, and `opts`.
- `lua/plugins/nvim-cmp.lua` already includes `hrsh7th/cmp-nvim-lsp`.
- `lua/plugins/nvim-lspconfig.lua` already applies `require("cmp_nvim_lsp").default_capabilities()` through `vim.lsp.config('*', ...)`, so LSP-based completion sources can use the current completion capabilities without extra global wiring.
- `lua/plugins/nvim-treesitter.lua` already ensures the `markdown` and `markdown_inline` parsers are present.

## Goals

- Add `render-markdown.nvim` in the same format as existing plugin files.
- Keep configuration minimal and close to upstream documentation.
- Reuse `nvim-tree/nvim-web-devicons` instead of introducing another icon provider.
- Enable the plugin's in-process LSP completion support.
- Lazy-load for markdown-like filetypes used in this setup.

## Non-Goals

- No broad visual customization beyond a minimal, documented setup.
- No refactor of existing `nvim-cmp` or LSP configuration unless required for the plugin to function.
- No new global mappings, commands, or theme-specific highlight overrides.

## Chosen Approach

Create a dedicated plugin file:

- Path: `lua/plugins/render-markdown.lua`
- Header: match the repository's existing plugin header style.
- Lazy loading: use `ft = { 'markdown', 'quarto', 'gitcommit' }`
- Dependencies:
  - `nvim-treesitter/nvim-treesitter`
  - `nvim-tree/nvim-web-devicons`
- Configuration style: use `opts = { ... }` for a concise lazy.nvim-native setup.

Plugin options will remain minimal:

- `completions = { lsp = { enabled = true } }`

This keeps the config explicit and aligned with upstream guidance that `ft` lazy loading should mirror the filetypes the plugin is expected to render. The plugin can derive its runtime `file_types` from `lazy.nvim` `ft`, so the filetype list only needs to live in one place.

## Alternatives Considered

### Narrower filetype scope

Only configure `markdown` and rely on upstream injections for markdown-like content in other buffers.

Rejected because the agreed scope explicitly includes extra filetypes, and keeping them in `ft` makes lazy-loading behavior obvious and predictable.

### More opinionated render configuration

Set presets, render modes, anti-conceal overrides, or visual component tweaks during initial installation.

Rejected because the stated goal is a minimal setup. Additional visual tuning can be added later without changing the structural integration.

### Additional `nvim-cmp` changes

Add explicit cmp source changes or plugin-specific completion wiring in `lua/plugins/nvim-cmp.lua`.

Rejected because upstream documentation indicates the plugin's in-process LSP completion works with `nvim-cmp` when enabled, and the existing LSP capability wiring already covers the expected integration point.

## Implementation Details

### New file

Add `lua/plugins/render-markdown.lua` with:

- Repository-standard header comments.
- A single plugin spec table for `MeanderingProgrammer/render-markdown.nvim`.
- `ft` for lazy loading.
- `dependencies` referencing treesitter and devicons.
- `opts` enabling LSP completions.

Expected shape:

```lua
return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto", "gitcommit" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        completions = {
            lsp = {
                enabled = true,
            },
        },
    },
}
```

### Existing files

The implementation is expected to modify `lazy-lock.json` when `lazy.nvim` resolves and records the plugin version.

The current `nvim-lspconfig.lua` already supplies cmp-aware LSP capabilities globally. That is sufficient for this plugin's documented completion path, so no extra edits are planned unless verification shows a gap.

## Verification Plan

After implementation:

- Run a plugin or config validation command appropriate for this repository, such as a headless Neovim startup check.
- Confirm the new plugin spec loads without syntax or dependency errors.
- Open a markdown-like buffer and verify the plugin loads on the configured filetypes.
- Confirm that the plugin configuration includes `completions.lsp.enabled = true` and does not require extra `nvim-cmp` source registration.

## Risks

- `quarto` filetype support depends on the filetype being present in the user's environment.
- If the plugin expects an additional explicit LSP enable step beyond capability wiring, verification may reveal a necessary follow-up edit.
- If this setup uses a different preferred markdown-adjacent filetype later, the `ft` list will need to be updated.

## Open Decisions Resolved

- Use a dedicated plugin file: yes.
- Keep the initial setup minimal: yes.
- Reuse `nvim-web-devicons`: yes.
- Include extra filetypes now: yes, `quarto` and `gitcommit`.
- Enable plugin LSP completions: yes.
