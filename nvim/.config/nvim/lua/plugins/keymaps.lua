return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    local harpoon = require("harpoon")

    -- File commands
    wk.register({
      ["<leader>f"] = { name = "+file" },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Grep Files" },
      ["<leader>fd"] = { "<cmd>Telescope diagnostics<cr>", "Find Code Diagnostics" },
      ["<leader>fn"] = { "<cmd>enew<cr>", "New file" },
      ["<leader>ft"] = { "<cmd>Neotree filesystem reveal left<cr>", "Open filetree" },
      ["<leader>fb"] = { "<cmd>Neotree buffers reveal float<cr>", "Open buffers" },
      ["<leader>fr"] = { "<cmd>Telescope lsp_references<cr>", "Find references" },
      ["<leader>fh"] = {
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        "Find harpooned files",
      },
    })

    -- Code commands
    wk.register({
      ["<leader>c"] = { name = "+code" },
      ["<leader>ch"] = { vim.lsp.buf.hover, "Show docs" },
      ["<leader>cf"] = { vim.lsp.buf.format, "Format File" },
      ["<leader>cr"] = { vim.lsp.buf.rename, "Rename variable" },
      ["<leader>cd"] = { "<cmd>Telescope lsp_definitions<cr>", "Goto definition" },
      ["<leader>ca"] = { vim.lsp.buf.code_action, "Code Actions" },
      ["<leader>cT"] = { require("jdtls").test_class, "Test Class with Debug" },
      ["<leader>ct"] = { "<cmd>TestFile<cr>", "Test File" },
      ["<leader>cc"] = { name = "+comment" },
      ["<leader>ccl"] = { "<Plug>(comment_toggle_linewise_current)", "Comment line" },
      ["<leader>ccb"] = { "<Plug>(comment_toggle_blockwise_current)", "Comment block" },
    })

    -- Debug commands
    wk.register({
      ["<leader>cx"] = { name = "+debug" },
      ["<leader>cxt"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle Debugger" },
      ["<leader>cxb"] = { require("dap").toggle_breakpoint, "Add/Remove Breakpoint" },
      ["<leader>cxr"] = { require("dap").continue, "Run/Continue" },
      ["<leader>cxs"] = { require("dap").step_over, "Step Over" },
      ["<leader>cxi"] = { require("dap").step_into, "Step Into" },
    })

    wk.register({
      ["<leader>cc"] = { name = "+comment" },
      ["<leader>ccl"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment line" },
      ["<leader>ccb"] = { "<Plug>(comment_toggle_blockwise_visual)", "Comment block" },
    }, { mode = "v" })

    -- Git commands
    wk.register({
      ["<leader>g"] = { name = "+git" },
      ["<leader>gp"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
      ["<leader>ga"] = { "<cmd>Gitsigns stage_buffer<cr>", "Stage File" },
      ["<leader>gu"] = { "<cmd>Gitsigns reset_buffer<cr>", "Un-stage File" },
      ["<leader>gd"] = { "<cmd>Gitsigns diffthis<cr>", "Diff file" },
      ["<leader>gc"] = { "<cmd>Telescope git_bcommits<cr>", "List commits for current buffer" },
      ["<leader>gs"] = { "<cmd>Telescope git_status<cr>", "Git status" },
      ["<leader>gS"] = { "<cmd>Telescope git_stash<cr>", "List stashes" },
      ["<leader>gt"] = { name = "+toggle" },
      ["<leader>gtd"] = { "<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted" },
      ["<leader>gtb"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle line blame" },
    })

    -- Terraform commands
    wk.register({
      ["<leader>t"] = { name = "+terraform" },
      ["<leader>td"] = { name = "+docs" },
      ["<leader>tda"] = { "<cmd>Telescope terraform_doc full_name=hashicorp/aws<cr>", "Terraform Docs [AWS]" },
      ["<leader>tdz"] = { "<cmd>Telescope terraform_doc full_name=hashicorp/azure<cr>", "Terraform Docs [Azure]" },
      ["<leader>tdm"] = { "<cmd>Telescope terraform_doc modules<cr>", "Terraform Docs [Modules]" },
    })

    -- Obsidian Keymaps
    wk.register({
      ["<leader>o"] = { name = "+obsidian" },
      ["<leader>of"] = { "<cmd>ObsidianFollowLink<cr>", "Follow Link" },
      ["<leader>ob"] = { "<cmd>ObsidianBacklinks<cr>", "Show Back Links" },
      ["<leader>ot"] = { "<cmd>ObsidianTags<cr>", "Search Tags" },
      ["<leader>od"] = { "<cmd>ObsidianToday<cr>", "Create/Open today's daily note" },
      ["<leader>on"] = { "<cmd>ObsidianNew<cr>", "New note" },
      ["<leader>oi"] = { "<cmd>ObsidianTemplate<cr>", "Insert template" },
      ["<leader>oc"] = { require("obsidian").util.toggle_checkbox, "Toggle Checkbox" },
    })
    wk.register({
      ["<leader>o"] = { name = "+obsidian" },
      ["<leader>ox"] = { "<cmd>ObsidianExtractNote<cr>", "Extract note" },
    }, { mode = "v", silent = false })

    -- Navigate vim panes better
    wk.register({
      ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Navigate to pane above" },
      ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Navigate to pane below" },
      ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Navigate to pane left" },
      ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Navigate to pane right" },
    })

    -- Misc
    wk.register({
      ["<leader>h"] = { "<cmd>nohlsearch<cr>", "Remove search highlighting" },
      ["<leader>tl"] = { "<cmd>TodoTelescope<cr>", "Search Todo list" },
      ["<leader>sh"] = { "<cmd>Telescope help_tags<cr>", "Search Help" },
      ["<leader>M"] = { "<cmd>MaximizerToggle<cr>", "Maximize pane" },
    })

    -- Harpoon Keymaps
    wk.register({
      ["<leader>a"] = {
        function()
          harpoon:list():add()
        end,
        "Harpoon current file",
      },
      ["<leader>r"] = {
        function()
          harpoon:list():remove()
        end,
        "Unharpoon current file",
      },
      ["<leader>1"] = {
        function()
          harpoon:list():select(1)
        end,
        "Open harpooned file",
      },
      ["<leader>2"] = {
        function()
          harpoon:list():select(2)
        end,
        "Open harpooned file",
      },
      ["<leader>3"] = {
        function()
          harpoon:list():select(3)
        end,
        "Open harpooned file",
      },
      ["<leader>4"] = {
        function()
          harpoon:list():select(4)
        end,
        "Open harpooned file",
      },
      ["<leader>5"] = {
        function()
          harpoon:list():select(5)
        end,
        "Open harpooned file",
      },
    })
  end,
}
