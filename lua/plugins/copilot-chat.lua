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
    
    -- Quick actions with auto-apply
    { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Explain code", mode = { "n", "v" } },
    { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Generate tests", mode = { "n", "v" } },
    { "<leader>cr", "<cmd>CopilotChatReview<cr>", desc = "Review code", mode = { "n", "v" } },
    { "<leader>cR", "<cmd>CopilotChatRefactor<cr>", desc = "Refactor code", mode = { "n", "v" } },
    { "<leader>cn", "<cmd>CopilotChatBetterNamings<cr>", desc = "Better naming", mode = { "n", "v" } },
    { "<leader>cd", "<cmd>CopilotChatDocs<cr>", desc = "Generate docs", mode = { "n", "v" } },
    { "<leader>cf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "Fix diagnostic", mode = { "n", "v" } },
    { "<leader>co", "<cmd>CopilotChatOptimize<cr>", desc = "Optimize code", mode = { "n", "v" } },
    
    -- Agent-like actions that apply changes directly
    { "<leader>ca", "<cmd>CopilotChatApply<cr>", desc = "Apply suggested changes", mode = { "n", "v" } },
    { "<leader>ci", "<cmd>CopilotChatImplement<cr>", desc = "Implement feature", mode = { "n", "v" } },
    { "<leader>cF", "<cmd>CopilotChatAutoFix<cr>", desc = "Auto-fix issues", mode = { "n", "v" } },
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
      -- Agent-like prompts that can apply changes
      Apply = {
        prompt = "Apply the suggested changes to the code. Replace the selected code with the improved version and explain what was changed.",
        system_prompt = "You are an AI agent that can make direct code changes. When asked to apply changes, provide the complete corrected code that should replace the selection.",
      },
      Implement = {
        prompt = "/COPILOT_GENERATE Implement the requested feature or functionality. Provide complete, working code that can be directly applied to the file.",
        system_prompt = "You are a code implementation agent. Generate complete, production-ready code that implements the requested functionality.",
      },
      AutoFix = {
        prompt = "/COPILOT_FIX Automatically fix all issues in this code including:\n- Syntax errors\n- Logic errors\n- Performance issues\n- Best practice violations\nProvide the complete fixed code.",
        system_prompt = "You are an auto-fix agent. Analyze the code and provide a completely corrected version that fixes all identifiable issues.",
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
    
    -- Agent-like behavior configuration
    auto_follow_cursor = false,
    clear_chat_on_new_prompt = false,
    
    -- Mappings for applying changes
    mappings = {
      complete = {
        detail = "Use @codebase to include the entire codebase as context for large changes",
        insert = "@codebase",
      },
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      reset = {
        normal = "<C-x>",
        insert = "<C-x>",
      },
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-CR>",
      },
      accept_diff = {
        normal = "<C-y>",
        insert = "<C-y>",
      },
    },
  },
  config = function(_, opts)
    local chat = require("CopilotChat")
    local select = require("CopilotChat.select")
    chat.setup(opts)
    
    -- Custom command for quick questions
    vim.api.nvim_create_user_command("CopilotChatQuick", function(args)
      chat.ask(args.args, {
        selection = select.visual,
      })
    end, { nargs = "*", range = true })
    
    -- Agent-like commands that apply changes directly
    vim.api.nvim_create_user_command("CopilotChatApply", function()
      chat.ask("Apply the suggested changes to the selected code. Provide the complete corrected code that should replace the current selection.", {
        selection = select.visual,
        callback = function(response)
          -- Auto-apply the changes if they look like code
          if response and response:match("```") then
            vim.notify("Copilot provided code changes. Use Ctrl+Y to accept or review in chat window.", vim.log.levels.INFO)
          end
        end,
      })
    end, { range = true })
    
    vim.api.nvim_create_user_command("CopilotChatImplement", function(args)
      local prompt = "Implement the following functionality: " .. (args.args or "")
      chat.ask(prompt .. "\nProvide complete, working code that implements this feature.", {
        selection = select.buffer,
      })
    end, { nargs = "*" })
    
    vim.api.nvim_create_user_command("CopilotChatAutoFix", function()
      chat.ask("Analyze this code and fix all issues including syntax errors, logic errors, and best practice violations. Provide the complete corrected code.", {
        selection = select.visual,
      })
    end, { range = true })
    
    -- Enhanced keybindings
    vim.keymap.set("v", "<leader>cq", ":CopilotChatQuick ", { desc = "Ask Copilot (visual)" })
    vim.keymap.set("n", "<leader>cq", function()
      local input = vim.fn.input("Ask Copilot: ")
      if input ~= "" then
        chat.ask(input)
      end
    end, { desc = "Ask Copilot" })
    
    -- Agent-style workflow keybindings
    vim.keymap.set("n", "<leader>cw", function()
      local input = vim.fn.input("What would you like me to do? ")
      if input ~= "" then
        chat.ask("You are an AI agent. " .. input .. " Provide actionable code that I can directly apply to my project.", {
          selection = select.buffer,
        })
      end
    end, { desc = "AI Agent Workflow" })
    
    -- Quick apply changes from chat
    vim.keymap.set("n", "<C-y>", function()
      vim.notify("Use the CopilotChat diff commands to apply changes", vim.log.levels.INFO)
    end, { desc = "Accept Copilot changes" })
  end,
}
