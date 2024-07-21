local function load_plugins_from_dir(dir)
	local plugins = {}
	local plugin_files = vim.fn.globpath(dir, "*.lua", false, true)
	for _, file in ipairs(plugin_files) do
		local plugin = dofile(file)
		table.insert(plugins, plugin)
	end
	return plugins
end

local plugin_dirs = { "~/.config/nvim/lua/plugins", "~/.config/nvim/lua/themes" }
local plugins = {}

for _, dir in ipairs(plugin_dirs) do
	local dir_plugins = load_plugins_from_dir(dir)
	vim.list_extend(plugins, dir_plugins)
end

return plugins
