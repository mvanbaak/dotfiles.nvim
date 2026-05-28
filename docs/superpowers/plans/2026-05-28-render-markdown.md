# Render Markdown Plugin Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add `MeanderingProgrammer/render-markdown.nvim` to this Neovim config as a documented `lazy.nvim` plugin spec that lazy-loads for `markdown`, `quarto`, and `gitcommit`, reuses `nvim-web-devicons`, and enables the plugin's LSP completion support.

**Architecture:** Keep the change isolated to a single new plugin file under `lua/plugins/`, matching the repository's header style and existing lazy.nvim conventions. Reuse the already-installed Treesitter parsers and the existing global `cmp_nvim_lsp` capability wiring instead of changing `nvim-cmp` or `nvim-lspconfig`.

**Tech Stack:** Neovim Lua config, `lazy.nvim`, `render-markdown.nvim`, `nvim-treesitter`, `nvim-web-devicons`, `nvim-cmp`, built-in Neovim LSP.

---

## File Structure

- Create: `lua/plugins/render-markdown.lua`
  - Responsibility: define the new lazy.nvim plugin spec with the repository-standard header, lazy-loading filetypes, dependencies, and minimal upstream-aligned options.
- Modify: `lazy-lock.json`
  - Responsibility: record the resolved `render-markdown.nvim` plugin version after lazy.nvim installs it.
- Create: `docs/superpowers/specs/2026-05-28-render-markdown-design.md`
  - Responsibility: capture the approved design and integration rationale for the new plugin.
- Create: `docs/superpowers/plans/2026-05-28-render-markdown.md`
  - Responsibility: capture the implementation checklist and verification steps used for the change.
- Read for pattern matching only: `lua/plugins/nvim-tree.lua`
  - Responsibility: example of concise plugin-file structure and dependency declaration.
- Read for integration context only: `lua/plugins/nvim-lspconfig.lua`
  - Responsibility: confirms global `cmp_nvim_lsp` capabilities are already applied.
- Read for dependency context only: `lua/plugins/nvim-treesitter.lua`
  - Responsibility: confirms `markdown` and `markdown_inline` parsers are already installed.

### Task 1: Add the render-markdown plugin spec

**Files:**
- Create: `lua/plugins/render-markdown.lua`
- Read: `lua/plugins/nvim-tree.lua`
- Read: `lua/plugins/nvim-lspconfig.lua`
- Read: `lua/plugins/nvim-treesitter.lua`

- [ ] **Step 1: Confirm the target file does not already exist**

Run: `ls "lua/plugins"`
Expected: the directory lists existing plugin files and does not include `render-markdown.lua`.

- [ ] **Step 2: Create `lua/plugins/render-markdown.lua` with the complete plugin spec**

```lua
-- ================================================================================================
-- TITLE : render-markdown.nvim
-- ABOUT : Improve viewing Markdown files in Neovim.
-- LINKS :
--   > github : https://github.com/MeanderingProgrammer/render-markdown.nvim
--   > wiki   : https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
-- ================================================================================================

return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = {
        "markdown",
        "quarto",
        "gitcommit",
    },
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

- [ ] **Step 3: Run a headless Neovim startup check**

Run: `nvim --headless "+quit"`
Expected: command exits successfully with no Lua errors or plugin-spec parse errors.

- [ ] **Step 4: Run a headless check that the new plugin spec is registered with lazy.nvim**

Run: `nvim --headless "+lua local plugins = require('lazy.core.config').plugins local plugin = plugins['render-markdown.nvim'] or plugins['MeanderingProgrammer/render-markdown.nvim'] assert(plugin, 'render-markdown plugin spec missing') assert(vim.tbl_contains(plugin.ft or {}, 'markdown'), 'markdown ft missing') assert(vim.tbl_contains(plugin.ft or {}, 'quarto'), 'quarto ft missing') assert(vim.tbl_contains(plugin.ft or {}, 'gitcommit'), 'gitcommit ft missing') print('render-markdown spec ok')" +qa`
Expected: prints `render-markdown spec ok` and exits successfully.

- [ ] **Step 5: Manually verify lazy-loading behavior in a markdown-like buffer**

Run: `nvim README.md`
Expected: Neovim opens normally, `:Lazy` shows `render-markdown.nvim` available, and opening a `markdown` buffer is sufficient to trigger plugin loading.

Then run inside Neovim:

```vim
:set filetype?
:RenderMarkdown enable
:lua print(vim.inspect(require('render-markdown.state').completions.lsp.enabled))
```

Expected:
- `filetype=markdown` for `README.md`
- `:RenderMarkdown enable` is available without an unknown-command error
- Lua prints `true`

- [ ] **Step 6: Manually verify the extra filetypes are configured**

Run inside Neovim:

```vim
:enew
:set filetype=quarto
:Lazy load render-markdown.nvim
:lua print(vim.inspect(require('render-markdown.state').file_types))
```

Expected:
- The plugin loads without error for `quarto`
- The printed list includes `markdown`, `quarto`, and `gitcommit`

- [ ] **Step 7: Commit the isolated config change**

```bash
git add lua/plugins/render-markdown.lua lazy-lock.json docs/superpowers/specs/2026-05-28-render-markdown-design.md docs/superpowers/plans/2026-05-28-render-markdown.md
git commit -m "feat(markdown): add render-markdown plugin"
```

## Self-Review Checklist

- The plan adds exactly one new config file and does not require modifying existing plugin files.
- The plugin header format matches the repository standard used in `lua/plugins/`.
- The plugin depends on `nvim-treesitter` and `nvim-web-devicons`, not a new icon provider.
- `ft` includes `markdown`, `quarto`, and `gitcommit`.
- `opts.completions.lsp.enabled` is set to `true`.
- Verification includes both syntax/startup checks and plugin-registration checks.
