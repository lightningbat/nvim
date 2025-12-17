-- Use the active LSP client's offset encoding for position params (UTF-16 fallback)
local function get_offset_encoding()
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
		if client.offset_encoding then
			return client.offset_encoding
		end
	end
	return "utf-16" -- fallback
end

vim.lsp.util.make_position_params(0, {
	position_encoding_kind = get_offset_encoding(),
})
