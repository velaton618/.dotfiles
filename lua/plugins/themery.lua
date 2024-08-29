return {
	"zaldih/themery.nvim",
	config = function()
		require("themery").setup({
			themes = { "kanagawa-paper", "mellifluous" },
			livePreview = true,
		})
	end,
}
