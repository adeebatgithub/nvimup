require('nvim-treesitter.configs').setup {
    -- Ensure these parsers are installed
    ensure_installed = { "python", "go", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- Highlight settings
    highlight = {
        enable = true, -- Enable tree-sitter highlighting

        -- Disable highlighting for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Disable additional regex highlighting
        additional_vim_regex_highlighting = false,
    },
}

require 'nvim-treesitter.install'.prefer_git = false
