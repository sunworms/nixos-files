return {
	"mini.statusline",
	event = "DeferredUIEnter",
	after = function()
		require("mini.statusline").setup()
	end,
}
