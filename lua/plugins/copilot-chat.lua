-- GitHub Copilot Chat for interactive AI assistance
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
    -- Open chat
    { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat", mode = { "n", "v" } },
    { "<leader>cx", "<cmd>CopilotChatReset<cr>", desc = "Clear Copilot Chat", mode = { "n", "v" } },
    
    -- Quick actions
    { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code", mode = { "n", "v" } },
    { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Generate tests", mode = { "n", "v" } },
    { "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "Review code", mode = { "n", "v" } },
    { "<leader>cR", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code", mode = { "n", "v" } },
    { "<leader>cn", "<cmd>CopilotChatBetterNamings<cr>", desc = "Better naming", mode = { "n", "v" } },
    { "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "Generate docs", mode = { "n", "v" } },
    { "<leader>cf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix diagnostic", mode = { "n", "v" } },
    { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize code", mode = { "n", "v" } },
  },
  opts = {
    debug = false,
    show_help = "yes",
    
    -- Chat window configuration
    window = {
      layout = "float",
      width = 0.8,
      height = 0.8,
      border = "rounded",
    },
    
    -- Custom prompts
    prompts = {
      Explain = {
        prompt = "/COPILOT_EXPLAIN Write a detailed explanation of the selected code. Focus on:\n- What the code does\n- How it works\n- Why it's structured this way\n- Any potential issues or improvements",
      },
      Review = {
        prompt = "/COPILOT_REVIEW Review this code for:\n- Best practices\n- Performance issues\n- Security vulnerabilities\n- Code smells\n- Potential bugs",
      },
      Tests = {
        prompt = "/COPILOT_GENERATE Generate comprehensive unit tests for this code. Include:\n- Happy path tests\n- Edge cases\n- Error handling\n- Mock dependencies if needed",
      },
      Refactor = {
        prompt = "/COPILOT_REFACTOR Refactor this code to improve:\n- Readability\n- Performance\n- Maintainability\n- Follow language best practices",
      },
      FixDiagnostic = {
        prompt = "/COPILOT_FIX Fix the diagnostic issue in this code. Explain:\n- What the problem is\n- Why it's a problem\n- How your fix resolves it",
      },
      BetterNamings = {
        prompt = "/COPILOT_REFACTOR Suggest better variable and function names for this code. Consider:\n- Clarity and readability\n- Naming conventions\n- Descriptiveness",
      },
      Docs = {
        prompt = "/COPILOT_GENERATE Generate comprehensive documentation for this code including:\n- Function/method description\n- Parameters and return types\n- Usage examples\n- Edge cases",
      },
      Optimize = {
        prompt = "/COPILOT_REFACTOR Optimize this code for better performance. Consider:\n- Time complexity\n- Space complexity\n- Resource usage\n- Algorithmic improvements",
      },
      -- Custom: Commit message
      CommitStaged = {
        prompt = 'Write a commit message for the staged changes following conventional commits format. Consider:\n- Type (feat/fix/docs/style/refactor/test/chore)\n- Scope if applicable\n- Clear description',
        selection = function(source)
          return require("CopilotChat.select").gitdiff(source, true)
        end,
      },
      -- Custom: Security review
      Security = {
        prompt = "/COPILOT_REVIEW Review this code specifically for security issues:\n- SQL injection\n- XSS vulnerabilities\n- Authentication/Authorization issues\n- Data validation\n- Sensitive data exposure",
      },
    },
    
    -- Auto-insert mode when opening chat
    auto_insert_mode = true,
    
    -- Show folds for sections in chat
    show_folds = true,
    
    -- Highlight selection
    highlight_selection = true,
    
    -- Context for chat
    context = "buffers", -- Use 'buffer' or 'buffers' or nil
    
    -- Model selection (if available)
    model = "gpt-4",
    
    -- Temperature
    temperature = 0.1,
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    chat.setup(opts)
    
    -- Custom command for quick questions
    vim.api.nvim_create_user_command("CopilotChatQuick", function(args)
      chat.ask(args.args, {
        selection = require("CopilotChat.select").visual,
      })
    end, { nargs = "*", range = true })
    
    -- Keybinding for quick questions
    vim.keymap.set("v", "<leader>cq", ":CopilotChatQuick ", { desc = "Ask Copilot (visual)" })
    vim.keymap.set("n", "<leader>cq", function()
      local input = vim.fn.input("Ask Copilot: ")
      if input ~= "" then
        chat.ask(input)
      end
    end, { desc = "Ask Copilot" })
  end,
}
