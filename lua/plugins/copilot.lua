-- GitHub Copilot integration with GPT-4
return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Use GPT-4 model (gpt-4 or gpt-4-turbo)
    vim.g.copilot_model = "gpt-4"
    
    -- Enable inline suggestions while typing
    vim.g.copilot_filetypes = {
      ["*"] = true,
    }
    
    -- Copilot keybindings
    -- Enable Tab to accept suggestions (no custom mapping needed - uses Copilot's built-in)
    vim.g.copilot_no_tab_map = false  -- Allow Copilot to use Tab
    vim.g.copilot_assume_mapped = false
    
    -- Alternative keybinding with Ctrl+J
    vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion",
    })
    
    -- Accept word by word with Ctrl+Right Arrow
    vim.keymap.set("i", "<C-Right>", "<Plug>(copilot-accept-word)", { desc = "Accept Copilot word" })
    
    -- Accept line by line with Ctrl+Down Arrow  
    vim.keymap.set("i", "<C-Down>", "<Plug>(copilot-accept-line)", { desc = "Accept Copilot line" })
    
    -- Next suggestion with Alt+]
    vim.keymap.set("i", "<M-]>", "<Plug>(copilot-next)", { desc = "Next Copilot suggestion" })
    
    -- Previous suggestion with Alt+[
    vim.keymap.set("i", "<M-[>", "<Plug>(copilot-previous)", { desc = "Previous Copilot suggestion" })
    
    -- Dismiss suggestion with Ctrl+]
    vim.keymap.set("i", "<C-]>", "<Plug>(copilot-dismiss)", { desc = "Dismiss Copilot suggestion" })
  end,
}
