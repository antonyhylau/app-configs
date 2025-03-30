return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"Lazygit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	keys = {
		{ "<leader>gl", "<cmd>LazyGit<CR>", desc = "Open lazy git" },
	},
}
