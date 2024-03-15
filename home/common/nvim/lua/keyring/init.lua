-- Keyring helper for Neovim.
-- TODO: Make it async
local keyring = {}

-- This library has a hard dependency on the 'keyring' executable.
if not vim.fn.executable("keyring") then
	error(
		"keyring: 'keyring' executable not found. Please install it, ideally through a package manager: https://pypi.org/project/keyring/"
	)
end

local function run_cmd(command)
	local handle = io.popen(command)
	local output = handle:read("*a")
	handle:close()
	return output
end

function keyring.get(service, username)
	return run_cmd(string.format("bash -c 'keyring get %s %s'", service, username))
end

function keyring.set(service, username)
	return run_cmd(string.format("bash -c 'keyring set %s %s'", service, username))
end

function keyring.del(service, username)
	return run_cmd(string.format("bash -c 'keyring del %s %s'", service, username))
end

return keyring
