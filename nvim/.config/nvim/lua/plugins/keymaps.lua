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
  keys = {

  },
  config = function()
    local wk = require("which-key")
    local harpoon = require("harpoon")

    -- File commands
    wk.add({
      { "<leader>f",  group = "file" },
      { "<leader>fb", "<cmd>Neotree buffers reveal float<cr>",                     desc = "Open buffers" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>",                            desc = "Find Code Diagnostics" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>",                             desc = "Find File" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                              desc = "Grep Files" },
      { "<leader>fh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Find harpooned files" },
      { "<leader>fn", "<cmd>enew<cr>",                                             desc = "New file" },
      { "<leader>fr", "<cmd>Telescope lsp_references<cr>",                         desc = "Find references" },
      { "<leader>ft", "<cmd>Neotree filesystem reveal left<cr>",                   desc = "Open filetree" },
    })

    -- Code commands
    wk.add({
      { "<leader>c",   group = "code" },
      { "<leader>cT",  require("jdtls").test_class,                desc = "Test Class with Debug" },
      { "<leader>ca",  vim.lsp.buf.code_action,                    desc = "Code Actions" },
      { "<leader>cc",  group = "comment" },
      { "<leader>ccb", "<Plug>(comment_toggle_blockwise_current)", desc = "Comment block" },
      { "<leader>ccl", "<Plug>(comment_toggle_linewise_current)",  desc = "Comment line" },
      { "<leader>cd",  "<cmd>Telescope lsp_definitions<cr>",       desc = "Goto definition" },
      { "<leader>cf",  vim.lsp.buf.format,                         desc = "Format File" },
      { "<leader>ch",  vim.lsp.buf.hover,                          desc = "Show docs" },
      { "<leader>cr",  vim.lsp.buf.rename,                         desc = "Rename variable" },
      { "<leader>ct",  "<cmd>TestFile<cr>",                        desc = "Test File" },
    })

    -- Debug commands
    wk.add({
      { "<leader>cx",  group = "debug" },
      { "<leader>cxb", require("dap").toggle_breakpoint,         desc = "Add/Remove Breakpoint" },
      { "<leader>cxi", require("dap").step_into,                 desc = "Step Into" },
      { "<leader>cxr", require("dap").continue,                  desc = "Run/Continue" },
      { "<leader>cxs", require("dap").step_over,                 desc = "Step Over" },
      { "<leader>cxt", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle Debugger" },
    })

    wk.add({
      mode = { "v" },
      { "<leader>cc",  group = "comment" },
      { "<leader>ccb", "<Plug>(comment_toggle_blockwise_visual)", desc = "Comment block" },
      { "<leader>ccl", "<Plug>(comment_toggle_linewise_visual)",  desc = "Comment line" },
    })

    -- Git commands
    wk.add({
      { "<leader>g",   group = "git" },
      { "<leader>gS",  "<cmd>Telescope git_stash<cr>",                desc = "List stashes" },
      { "<leader>ga",  "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage File" },
      { "<leader>gc",  "<cmd>Telescope git_bcommits<cr>",             desc = "List commits for current buffer" },
      { "<leader>gd",  "<cmd>Gitsigns diffthis<cr>",                  desc = "Diff file" },
      { "<leader>gp",  "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview hunk" },
      { "<leader>gs",  "<cmd>Telescope git_status<cr>",               desc = "Git status" },
      { "<leader>gt",  group = "toggle" },
      { "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle line blame" },
      { "<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>",            desc = "Toggle deleted" },
      { "<leader>gu",  "<cmd>Gitsigns reset_buffer<cr>",              desc = "Un-stage File" },
    })

    -- Terraform commands
    wk.add({
      { "<leader>t",   group = "terraform" },
      { "<leader>td",  group = "docs" },
      { "<leader>tda", "<cmd>Telescope terraform_doc full_name=hashicorp/aws<cr>",   desc = "Terraform Docs [AWS]" },
      { "<leader>tdm", "<cmd>Telescope terraform_doc modules<cr>",                   desc = "Terraform Docs [Modules]" },
      { "<leader>tdz", "<cmd>Telescope terraform_doc full_name=hashicorp/azure<cr>", desc = "Terraform Docs [Azure]" },
    })

    -- Obsidian Keymaps
    wk.add({
      { "<leader>o",  group = "obsidian" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>",             desc = "Show Back Links" },
      { "<leader>oc", require("obsidian").util.toggle_checkbox, desc = "Toggle Checkbox" },
      { "<leader>od", "<cmd>ObsidianToday<cr>",                 desc = "Create/Open today's daily note" },
      { "<leader>of", "<cmd>ObsidianFollowLink<cr>",            desc = "Follow Link" },
      { "<leader>oi", "<cmd>ObsidianTemplate<cr>",              desc = "Insert template" },
      { "<leader>on", "<cmd>ObsidianNew<cr>",                   desc = "New note" },
      { "<leader>ot", "<cmd>ObsidianTags<cr>",                  desc = "Search Tags" },
    })
    wk.add({
      { "<leader>o",  group = "obsidian",             mode = "v",            silent = false },
      { "<leader>ox", "<cmd>ObsidianExtractNote<cr>", desc = "Extract note", mode = "v",    silent = false },
    })

    -- Navigate vim panes better
    wk.add({
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>",  desc = "Navigate to pane left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>",  desc = "Navigate to pane below" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>",    desc = "Navigate to pane above" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to pane right" },
    })

    -- Misc
    wk.add({
      { "<leader>M",  "<cmd>MaximizerToggle<cr>",     desc = "Maximize pane" },
      { "<leader>h",  "<cmd>nohlsearch<cr>",          desc = "Remove search highlighting" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
      { "<leader>tl", "<cmd>TodoTelescope<cr>",       desc = "Search Todo list" },
    })

    -- Harpoon Keymaps
    wk.add({
      { "<leader>1", function() harpoon:list():select(1) end, desc = "Open harpooned file" },
      { "<leader>2", function() harpoon:list():select(2) end, desc = "Open harpooned file" },
      { "<leader>3", function() harpoon:list():select(3) end, desc = "Open harpooned file" },
      { "<leader>4", function() harpoon:list():select(4) end, desc = "Open harpooned file" },
      { "<leader>5", function() harpoon:list():select(5) end, desc = "Open harpooned file" },
      { "<leader>a", function() harpoon:list():add() end,     desc = "Harpoon current file" },
      { "<leader>r", function() harpoon:list():remove() end,  desc = "Unharpoon current file" },
    })
  end,
}
