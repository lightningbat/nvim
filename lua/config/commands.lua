-- Custom commands
vim.api.nvim_create_user_command("ProjectArgs", function()
	vim.cmd [[args `rg --files --glob '!node_modules/*' --glob '!dist/*'`]]
end, {})

