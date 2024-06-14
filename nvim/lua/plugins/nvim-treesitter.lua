return {
    "nvim-treesitter/nvim-treesitter",
    build=":TSUpdate",
    dependencies = {
    "windwp/nvim-ts-autotag",
    },
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "bash", "markdown", "markdown_inline", "latex", "python", "r", "html", "css", "json", "toml"  },
            sync_install = false,
            auto_install = true,
            ignore_install = {},
            highlight = { enable = true },
            indent = { enable = true },
      })
    end
}
