local util = {}

--- Make a keymap and ensure there are no duplicates of it.
function util.uniqueKeymap(modes, lhs, rhs, opts)
	if not opts then
		opts = {}
	end
	if opts.unique == nil then
		opts.unique = true
	end
	-- selene: allow(deprecated)
	vim.keymap.set(modes, lhs, rhs, opts)
end

return util
