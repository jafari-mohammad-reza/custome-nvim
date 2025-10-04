-- Which-key for showing keybinding hints
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      window = {
        border = "rounded",
      },
    })

    -- Register key groups
    wk.register({
      ["<leader>f"] = { name = "+find" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>c"] = { name = "+code" },
    })
  end,
}
