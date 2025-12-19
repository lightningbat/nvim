return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" }, -- lazy-load on buffer open

		config = function()
			local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

			local on_attach = function(_, bufnr)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = 'go to previous diagnostic' })
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = 'Go to next diagnostic' })
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'Go to Definition' })
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Find References' })
				vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { buffer = bufnr, desc = 'Go to Implementation' })
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover Documentation' })
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename Symbol' })
				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Action' })
				vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { buffer = bufnr, desc = 'Format Buffer' })
			end

			-- PYTHON
			vim.lsp.config('pyright', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- GO
			vim.lsp.config('gopls', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- LUA
			vim.lsp.config('lua_ls', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- JS / TS / JSX / TSX
			vim.lsp.config('ts_ls', {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- HTML
			vim.lsp.config('html', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- STYLESHEET
			vim.lsp.config('cssls', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- JSON
			vim.lsp.config('jsonls', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- MARKDOWN
			vim.lsp.config('marksman', {
				cmd = { vim.fn.expand("~/.local/bin/marksman-linux-x64") },
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- ESLINT
			vim.lsp.config('eslint', {
				on_attach = on_attach,
				capabilities = cmp_capabilities,
			})

			-- HTML EMMET
			vim.lsp.config('emmet_language_server', {})

			vim.lsp.enable({
				'pyright',
				'gopls',
				'ts_ls',
				'html',
				'cssls',
				'jsonls',
				'marksman',
				'eslint',
				'emmet_language_server',
			})
		end,
	},
}
