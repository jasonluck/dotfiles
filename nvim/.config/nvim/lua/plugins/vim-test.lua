return {
  "vim-test/vim-test",
  dependencies = {
    "mhinz/vim-tmuxify",
  },
  config = function()
    vim.cmd("let test#strategy = 'tmuxify'")
  end,
}
