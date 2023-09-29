return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",   -- Add indentation guides even on blank lines
    config = function()
        require("ibl").setup()
    end,
  }
