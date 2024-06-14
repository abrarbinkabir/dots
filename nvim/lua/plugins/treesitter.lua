return {
    "nvim-treesitter/nvim-treesitter",
    build=":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline", "latex", "python", "r", "html", "css", "json", "toml"  },
            highlight = { enable = true },
            indent = { enable = true },
      })
    end
}
