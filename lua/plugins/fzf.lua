return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("fzf-lua").setup({
			winopts = {
				fullscreen = true,
				preview = {
					-- layout = "vertial",
					-- vertical = "down:60%",

					layout = "horizontal",
					horizontal = "right:60%",
				},
			},

			oldfiles = { cwd_only = true },
		})
	end,
}
