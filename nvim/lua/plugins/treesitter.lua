return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")
      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
        highlight = {
          enable = true,
        },
        ensure_installed = { "python", "markdown", "markdown_inline", "latex", "bash", "html", "css" },
        auto_install = true,
        autopairs = {
        enable = true,
        },
        indent = { enable = true },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        })
      end,
  },
}
