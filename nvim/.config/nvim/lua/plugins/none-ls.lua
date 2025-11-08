return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.completion.spell,
				-- Terraform
				null_ls.builtins.formatting.terraform_fmt,
				null_ls.builtins.diagnostics.terraform_validate,
				-- Golang
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.diagnostics.golangci_lint,
				-- HCL / Packer
				null_ls.builtins.formatting.packer,
				-- YAML
				--null_ls.builtins.formatting.yq,
				-- JSON
				null_ls.builtins.formatting.jq,
			},

			--Auto Format on file save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
