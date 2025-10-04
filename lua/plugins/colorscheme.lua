-- Kanagawa Dragon colorscheme
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = true,
      terminalColors = true,
      theme = "dragon", -- Load "dragon" variant
      background = {
        dark = "dragon",
        light = "lotus",
      },
    })
    vim.cmd.colorscheme("kanagawa-dragon")
    
    -- Enhanced highlights for fresher completion and documentation look
    vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "#1F1F28", fg = "#DCD7BA" })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#54546D", bg = "#1F1F28" })
    vim.api.nvim_set_hl(0, "CmpDoc", { bg = "#16161D", fg = "#DCD7BA" })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = "#957FB8", bg = "#16161D" })
    vim.api.nvim_set_hl(0, "CmpGhostText", { fg = "#54546D", italic = true })
    
    -- Enhanced LSP diagnostic colors for better visibility
    vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { fg = "#E82424", bg = "#16161D" })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingWarn", { fg = "#FF9E3B", bg = "#16161D" })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingInfo", { fg = "#658594", bg = "#16161D" })
    vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#9CABCA", bg = "#16161D" })
  end,
}
